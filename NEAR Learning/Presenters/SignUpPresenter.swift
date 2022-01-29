//
//  SignUpPresenter.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 19/11/21.
//

import Foundation

protocol SignUpPresenterView: AnyObject {
  func signUp()
  func error(value: String)
}

class SignUpPresenter {
  weak var view: SignUpPresenterView?
  init(with view: SignUpPresenterView) {
    self.view = view
  }
  
  func signUpAction(name: String, email: String, password: String) {
    let signupBO = SignupBO()
    signupBO.signup(email: email, password: password, onSuccess: {
      self.view?.signUp()
    },onFailure: { error in
      self.view?.error(value: error)
    })
  }
}
