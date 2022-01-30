//
//  LoginPresenter.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 19/11/21.
//

import Foundation

protocol LoginPresenterView: AnyObject {
  func login()
  func recoverAccount()
  func signUp()
  func error(value: String)
}

class LoginPresenter {
  weak var view: LoginPresenterView?
  init(with view: LoginPresenterView) {
    self.view = view
  }
  
  func loginAction(email: String,password: String){
    let signupBO = SignupBO()
    signupBO.signIn(email: email, password: password, onSuccess: {
      self.view?.login()
    }, onFailure: { error in
      self.view?.error(value: error)
    })
    
  }
  func recoveryAccountAction(){
    view?.recoverAccount()
  }
  
  func signUpAction(){
    view?.signUp()
  }
}
