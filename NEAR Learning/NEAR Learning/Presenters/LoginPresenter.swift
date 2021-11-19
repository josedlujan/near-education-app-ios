//
//  LoginPresenter.swift
//  NEAR Learning
//
//  Created by Isaac R on 19/11/21.
//

import Foundation

protocol LoginPresenterView: AnyObject {
  func login()
  func recoverAccount()
  func signUp()
}

class LoginPresenter {
  weak var view: LoginPresenterView?
  init(with view: LoginPresenterView) {
    self.view = view
  }
  
  func loginAction(email: String,password: String){
    view?.login()
  }
  func recoveryAccountAction(){
    view?.recoverAccount()
  }
  
  func signUpAction(){
    view?.signUp()
  }
}
