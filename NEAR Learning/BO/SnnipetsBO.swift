//
//  SnnipetsBO.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 03/02/22.
//

import Foundation
class SnippetsBO{
    static let firebaseService = FirebaseService.shared
    
 static   func getAllCaterories(callback:@escaping([CategoryItem],Bool)->Void){
        self.firebaseService.db.collection("SnippetsCategorias").getDocuments(){(querySnapshot,err) in
            var categories:[CategoryItem] = []
                if let error = err{
                    debugPrint("error al consultar las categorias \(error)")
                    callback(categories,true)
                    return
                }
                guard let documents = querySnapshot?.documents else{
                   debugPrint("No hay categorias")
                    callback(categories,true)
                    return
                }
               
                for document in documents {
                    do {
                        let json = try JSONSerialization.data(withJSONObject: document.data())
                        let decoder = JSONDecoder()
                        let currentCategoryItem = try decoder.decode(CategoryItem.self, from: json)
                        categories.append(currentCategoryItem)
                    } catch {
                        callback(categories,true)
                        print(error)
                    }
                }
             callback(categories,false)
            }
        }
    
  static  func getSnnipetByCategory(idCategory:String, callback:@escaping([SnippetItem],Bool)->Void){
        self.firebaseService.db.collection("Snippets").whereField("id_categoria",isEqualTo: idCategory).getDocuments(){(querySnapshot,err) in
            var snnipets:[SnippetItem] = []
            if let error = err{
                debugPrint("error al consultar los Snnipets \(error)")
                callback(snnipets,true)
                return
            }
            guard let documents = querySnapshot?.documents else{
               debugPrint("No hay Snnipets")
                callback(snnipets,true)
                return
            }
           
            for document in documents {
                do {
                    let json = try JSONSerialization.data(withJSONObject: document.data())
                    let decoder = JSONDecoder()
                    let currentSnnipetItem = try decoder.decode(SnippetItem.self, from: json)
                    snnipets.append(currentSnnipetItem)
                } catch {
                    callback(snnipets,true)
                    print(error)
                }
            }
         callback(snnipets.sorted(by:{$0.id < $1.id}),false)
        }
    }
}
