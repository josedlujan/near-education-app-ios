//
//  GoalPresenter.swift
//  NEAR Learning
//
//  Created by Isaac R on 05/02/22.
//

import Foundation

protocol GoalPresenterView: AnyObject {
  func showMessage(message: String)
  func indicatorView(animating: Bool)
}

class GoalPresenter {
  weak var view: GoalPresenterView?
  var levels: [LevelItem] = []

  init(with view: GoalPresenterView) {
    self.view = view
  }
  
  func getLevel(idCategory: String, onSuccess: @escaping() -> Void){
    view?.indicatorView(animating: true)
    QuestionBO.getLevesByCategory(idCategory: idCategory) {[weak self] levels, isError in
      if !isError {
        self?.levels = levels.sorted(by: {$0.levelNumber < $1.levelNumber})
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

}
