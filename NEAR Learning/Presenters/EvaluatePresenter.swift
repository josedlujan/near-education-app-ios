//
//  EvaluatePresenter.swift
//  NEAR Learning
//
//  Created by Isaac R on 09/02/22.
//

import Foundation

protocol EvaluatePresenterView: AnyObject {
  func showMessage(message: String)
  func indicatorView(animating: Bool)
  func saveResult()
}
class EvaluatePresenter {
  weak var view: EvaluatePresenterView?
  let store = Store.sharedInstance
  
  init(with view: EvaluatePresenterView) {
    self.view = view
  }
  
  func saveAnswers(answers: AnswerItem) {
    QuestionBO.sedAnswers(answers: answers){[weak self] message,isError in
      if !isError{
        //self.store.deleteAll(objects: store.all(object: Evaluate.self)!)
        self?.store.deleteAll(objects: (self?.store.all(object: Evaluate.self)!)!)
        self?.view?.saveResult()
      }
      else{
        self?.view?.indicatorView(animating: false)
        self?.view?.showMessage(message: message)
      }
    }
  }
  
  func saveAction(){
    view?.saveResult()
  }
}
