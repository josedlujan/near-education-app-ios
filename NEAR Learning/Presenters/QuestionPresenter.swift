//
//  QuestionPresenter.swift
//  NEAR Learning
//
//  Created by Isaac R on 05/02/22.
//

import Foundation
protocol QuestionPresenterView: AnyObject {
  func showMessage(message: String)
  func indicatorView(animating: Bool)
}

class QuestionPresenter {
  weak var view: QuestionPresenterView?
  var questions: [QuestionItem] = []
  var answerSelected: [QuestionItem] = []
  var answerTemp: [AnswerDisplay] = []
  var questionsCount: Int = 0

  init(with view: QuestionPresenterView) {
    self.view = view
  }
  
    func getQuesions(idCategory: String, level: String, onSuccess: @escaping() -> Void){
    view?.indicatorView(animating: true)
      QuestionBO.getQuestionsByCategory(idCategory: idCategory, level: level) {[weak self] questions, isError in
      if !isError {
        self?.questions = questions
        self?.questionsCount = questions.count
        onSuccess()
      } else {
        self?.questionsCount = questions.count
        self?.view?.indicatorView(animating: false)
        self?.view?.showMessage(message: "No se pudieron obtener los niveles")
      }
    }
  }

  func indicatorView(present: Bool){
    view?.indicatorView(animating: present)
  }    
  
  func answer(section: Int, answer: String) {
    let answerSelected = AnswerDisplay(index: section, answer: answer)
    if answerTemp.contains(where: {$0.index == section}) {
      //remove element and added
      guard let index = answerTemp.firstIndex(where: {$0.index == section}) else {return}
      answerTemp.remove(at: index)
      answerTemp.append(answerSelected)
    } else {
      //add element"
      answerTemp.append(answerSelected)
    }
    debugPrint(answerSelected, " All elements")
  }

}
