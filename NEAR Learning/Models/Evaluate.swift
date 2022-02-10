//
//  Evaluate.swift
//  NEAR Learning
//
//  Created by Isaac R on 09/02/22.
//

import Foundation
import RealmSwift

class Evaluate: Object {
  static let store = Store.sharedInstance
  @objc dynamic var categoryId: String = ""
  @objc dynamic var levelId: String = ""
  @objc dynamic var answer: String = ""
  @objc dynamic var index = 0
  @objc dynamic var fail = 0
  @objc dynamic var rigth = 0
  
  static func evaluateAnswer(question: QuestionItem, index: Int, answer: String) {
    let evaluateObject = evaluateByCategoryAndIndex(categoryId: question.idCategory, index: index)
    if !evaluateObject.isEmpty {
      guard let value = evaluateObject.first as? Evaluate else {return}
      if value.answer == answer && value.index == index {
        store.update(object: value, value: 0, key: "fail")
        store.update(object: value, value: 1, key: "rigth")
      } else {
        store.update(object: value, value: 0, key: "rigth")
        store.update(object: value, value: 1, key: "fail")
      }
    } else {
      let evaluate = Evaluate()
      evaluate.categoryId = question.idCategory
      evaluate.levelId = question.idLevel
      evaluate.index = index
      evaluate.answer = question.answer
      if question.answer == answer {
        evaluate.rigth += 1
      } else {
        evaluate.fail += 1
      }
      store.save(object: evaluate)
    }
  }
  
  static func evaluateQuiz(categoryId: String, levelId: String) -> (count: Int, fail: Int, rigth: Int) {
    let category = NSPredicate(format: "categoryId LIKE[c]%@", categoryId)
    let level = NSPredicate(format: "levelId LIKE[c]%@", levelId)
    let compound = NSCompoundPredicate(andPredicateWithSubpredicates: [category, level])
    let questions = self.store.all(object: Evaluate.self)!.filter(compound)
    var rigth: Int = 0
    var fail: Int = 0
    questions.forEach { object in
      guard let question = object as? Evaluate else {return}
      if question.rigth == 1 {
        rigth += 1
      } else if question.fail == 1 {
        fail += 1
      }
    }
    return (questions.count, fail, rigth)
  }
  
  
  static func evaluateByCategoryAndIndex(categoryId: String, index: Int) -> Results<Object> {
    let origin = NSPredicate(format: "categoryId LIKE[c]%@", categoryId)
    let index = NSPredicate(format: "index == %i", index)
    let compound = NSCompoundPredicate(andPredicateWithSubpredicates: [origin, index])
    return self.store.all(object: Evaluate.self)!.filter(compound)
  }
}
