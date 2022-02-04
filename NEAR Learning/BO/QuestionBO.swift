//
//  QuestionBO.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 03/02/22.
//

import Foundation
class QuestionBO{
    let firebaseService:FirebaseService!
    init(firebaseService:FirebaseService) {
        self.firebaseService = firebaseService
    }
    func getAllCategories(callback:@escaping([CategoryItem],Bool)->Void){
        self.firebaseService.db.collection("TestCategorias").getDocuments(){(querySnapshot,err) in
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
    
    func getQuestionsByCategory(idCategory:String, callback:@escaping([QuestionItem],Bool)->Void){
        self.firebaseService.db.collection("TestPreguntas").whereField("id_categoria",isEqualTo: idCategory).getDocuments(){(querySnapshot,err) in
            var questions:[QuestionItem] = []
            if let error = err{
                debugPrint("error al consultar las preguntas \(error)")
                callback(questions,true)
                return
            }
            guard let documents = querySnapshot?.documents else{
               debugPrint("No hay Preguntas")
                callback(questions,true)
                return
            }
           
            for document in documents {
                do {
                    let json = try JSONSerialization.data(withJSONObject: document.data())
                    let decoder = JSONDecoder()
                    let currentquestionItem = try decoder.decode(QuestionItem.self, from: json)
                    questions.append(currentquestionItem)
                } catch {
                    callback(questions,true)
                    print(error)
                }
            }
         callback(questions,false)
        }
    }
}
