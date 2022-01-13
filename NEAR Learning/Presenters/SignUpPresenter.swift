//
//  SignUpPresenter.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 19/11/21.
//

import Foundation

protocol SignUpPresenterView: AnyObject {
  func signUp()
}

class SignUpPresenter {
  weak var view: SignUpPresenterView?
  init(with view: SignUpPresenterView) {
    self.view = view
  }
  
  func signUpAction(name: String, email: String, password: String) {
    view?.signUp()
  }
}
