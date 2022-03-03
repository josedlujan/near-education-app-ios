//
//  RecoveryAccountPresenter.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 19/11/21.
//

import Foundation

protocol RecoveryAccountPresenterView: AnyObject {
  func recovery()
  func error(value: String)
}

class RecoveryAccountPresenter {
  weak var view: RecoveryAccountPresenterView?
  init(with view: RecoveryAccountPresenterView) {
    self.view = view
  }
  
  func recoveyAction(email: String) {
      let signupBO = SignupBO()
      signupBO.passwordReset(email:email ,onSuccess:{[weak self] in
          self?.view?.recovery()
      }, onFailure: {[weak self]error in
          self?.view?.error(value: error)
      })
  }
}
