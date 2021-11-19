//
//  RecoveryAccountPresenter.swift
//  NEAR Learning
//
//  Created by Isaac R on 19/11/21.
//

import Foundation

protocol RecoveryAccountPresenterView: AnyObject {
  func recovery()
}

class RecoveryAccountPresenter {
  weak var view: RecoveryAccountPresenterView?
  init(with view: RecoveryAccountPresenterView) {
    self.view = view
  }
  
  func recoveyAction(email: String) {
    view?.recovery()
  }
}
