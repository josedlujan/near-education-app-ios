//
//  QuestionBO.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 03/02/22.
//

import Foundation
class QuestionBO{
  static let firebaseService = FirebaseService.shared
  
  static func getAllCategories(callback: @escaping([CategoryItem], Bool) -> Void) {
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
  
  static func getLevesByCategory(idCategory:String, callback: @escaping([LevelItem], Bool) -> Void) {
    self.firebaseService.db.collection("TestNiveles").whereField("id_categoria",isEqualTo: idCategory).getDocuments(){(querySnapshot,err) in
      var levels:[LevelItem] = []
      if let error = err{
        debugPrint("error al consultar los niveles \(error)")
        callback(levels,true)
        return
      }
      guard let documents = querySnapshot?.documents else{
        debugPrint("No hay niveles")
        callback(levels,true)
        return
      }
      
      for document in documents {
        do {
          let json = try JSONSerialization.data(withJSONObject: document.data())
          let decoder = JSONDecoder()
          let currentCategoryItem = try decoder.decode(LevelItem.self, from: json)
          levels.append(currentCategoryItem)
        } catch {
          callback(levels,true)
          print(error)
        }
      }
      callback(levels,false)
    }
  }
  
    static func getQuestionsByCategory(idCategory:String,level:String, callback: @escaping([QuestionItem], Bool) -> Void) {
      self.firebaseService.db.collection("TestPreguntas").whereField("id_categoria",isEqualTo: idCategory).whereField("id_nivel",isEqualTo:level).getDocuments(){(querySnapshot,err) in
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
        callback(questions.sorted(by: {$0.id < $1.id}),false)
    }
  }
    
    static func sedAnswers(answers:AnswerItem,callback:@escaping(String,Bool)->Void){
        guard let dataSend = answers.dictionary else{
            callback("Ocurrio un problema al tratar de convertir tus respuestas",true)
            return
        }
        self.firebaseService.db.collection("TestCalificaciones").document("\(answers.userMail)_\(answers.idCategory)_\(answers.idLevel)").setData(dataSend){err in
            guard let error = err else{
                callback("Respuestas almacenadas correctamente",false)
                return
            }
            debugPrint(error)
            callback("Ocurrio un problema al tratar de guardar las respuestas",true)
        }
    }
    static func getAnswers(idCategory:String,userMail:String,callback:@escaping([AnswerItem],Bool)->Void){
        self.firebaseService.db.collection("TestCalificaciones").whereField("id_Categoria",isEqualTo:idCategory).whereField("email",isEqualTo:userMail).getDocuments(){(querySnapshot,err) in
        var answers:[AnswerItem] = []
        if let error = err{
          debugPrint("error al consultar las respuestas \(error)")
          callback(answers,true)
          return
        }
        guard let documents = querySnapshot?.documents else{
          debugPrint("No hay Preguntas")
          callback(answers,true)
          return
        }
        
        for document in documents {
          do {
            let json = try JSONSerialization.data(withJSONObject: document.data())
            let decoder = JSONDecoder()
            let currentAnswerItem = try decoder.decode(AnswerItem.self, from: json)
              answers.append(currentAnswerItem)
          } catch {
            callback(answers,true)
            print(error)
          }
        }
          callback(answers,false)
      }
    }
    
}
