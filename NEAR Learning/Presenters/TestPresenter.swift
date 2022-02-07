//
//  TestPresenter.swift
//  NEAR Learning
//
//  Created by Isaac R on 05/02/22.
//

import Foundation

protocol TestPresenterView: AnyObject {
  func showMessage(message: String)
  func indicatorView(animating: Bool)
}

class TestPresenter {
  weak var view: TestPresenterView?
  var categories: [CategoryItem] = []
  var questions: [QuestionItem] = []
  
  init(with view: TestPresenterView) {
    self.view = view
  }
  
  func getAllTest(onSuccess: @escaping() -> Void) {
    view?.indicatorView(animating: true)
    QuestionBO.getAllCategories { [weak self] categories, isError in
      if !isError {
        self?.categories = categories
        onSuccess()
      } else {
        self?.view?.indicatorView(animating: false)
        self?.view?.showMessage(message: "No se pudieron obtener las ultimas noticias")
      }
    }
  }
  
//  func getQuestions(idCategory: String, onSuccess: @escaping() -> Void){
//    view?.indicatorView(animating: true)
//    QuestionBO.getQuestionsByCategory(idCategory: idCategory) {[weak self] questions, isError in
//      if !isError {
//        self?.questions = questions
//        onSuccess()
//      } else {
//        self?.view?.indicatorView(animating: false)
//        self?.view?.showMessage(message: "No se pudieron obtener las ultimas noticias")
//      }
//    }
//  }
//  
  func indicatorView(present: Bool){
    view?.indicatorView(animating: present)
  }
  
}
