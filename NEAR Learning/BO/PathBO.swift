//
//  PathBO.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 08/02/22.
//

import Foundation
class PathBO{
    static let firebaseService = FirebaseService.shared
    
    static func getAllCategories(callback:@escaping([PathCategoryItem],Bool)->Void){
        self.firebaseService.db.collection("pathCategorias").whereField("activo", isEqualTo: true).getDocuments(){(querySnapshot,err) in
            var pathCategories:[PathCategoryItem] = []
            if let error = err{
                debugPrint("error al consultar los paths \(error)")
                callback(pathCategories,true)
                return
            }
            guard let documents = querySnapshot?.documents else{
               debugPrint("No hay paths")
                callback(pathCategories,true)
                return
            }
           
            for document in documents {
                do {
                    let json = try JSONSerialization.data(withJSONObject: document.data())
                    let decoder = JSONDecoder()
                    let currentPathCategoryItem = try decoder.decode(PathCategoryItem.self, from: json)
                    pathCategories.append(currentPathCategoryItem)
                } catch {
                    callback(pathCategories,true)
                    print(error)
                }
            }
            callback(pathCategories.sorted(by:{$0.order < $1.order}),false)
        }
    }
    
    static func getPatsByCategory(idCategory:String,callback:@escaping([PathItem],Bool)->Void){
        self.firebaseService.db.collection("Path").whereField("id_categoria", isEqualTo: idCategory).getDocuments(){(querySnapshot,err) in
            var paths:[PathItem] = []
            if let error = err{
                debugPrint("error al consultar los paths \(error)")
                callback(paths,true)
                return
            }
            guard let documents = querySnapshot?.documents else{
               debugPrint("No hay paths")
                callback(paths,true)
                return
            }
           
            for document in documents {
                do {
                    let json = try JSONSerialization.data(withJSONObject: document.data())
                    let decoder = JSONDecoder()
                    let currentPathItem = try decoder.decode(PathItem.self, from: json)
                    paths.append(currentPathItem)
                } catch {
                    callback(paths,true)
                    print(error)
                }
            }
         callback(paths,false)
        }
    }
    
}
