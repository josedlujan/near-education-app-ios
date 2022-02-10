//
//  EvaluatePresenter.swift
//  NEAR Learning
//
//  Created by Isaac R on 09/02/22.
//

import Foundation

protocol EvaluatePresenterView: AnyObject {
  func saveResult()
}
class EvaluatePresenter {
    weak var view: EvaluatePresenterView?
    
    init(with view: EvaluatePresenterView) {
      self.view = view
    }
  
  func saveAction(){
    view?.saveResult()
  }
}
