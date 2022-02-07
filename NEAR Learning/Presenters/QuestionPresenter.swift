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

  init(with view: QuestionPresenterView) {
    self.view = view
  }
  
  func getQuesions(idCategory: String, onSuccess: @escaping() -> Void){
    view?.indicatorView(animating: true)
    QuestionBO.getQuestionsByCategory(idCategory: idCategory) {[weak self] questions, isError in
      if !isError {
        self?.questions = questions.sorted(by: {$0.id < $1.id})
        onSuccess()
      } else {
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
      debugPrint("remove element and added")
      guard let index = answerTemp.firstIndex(where: {$0.index == section}) else {return}
      answerTemp.remove(at: index)
      answerTemp.append(answerSelected)
    } else {
      debugPrint("add element")
      answerTemp.append(answerSelected)
    }
    debugPrint(answerSelected, " All elements")
  }

}
