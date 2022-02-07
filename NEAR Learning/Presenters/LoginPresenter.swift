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
  func indcatorView(animating: Bool)
}

class LoginPresenter {
  weak var view: LoginPresenterView?
  init(with view: LoginPresenterView) {
    self.view = view
  }
  
  func loginAction(email: String,password: String){
    let signupBO = SignupBO()
    signupBO.signIn(email: email, password: password, onSuccess: {
      self.view?.indcatorView(animating: false)
      self.view?.login()
    }, onFailure: { error in
      self.view?.indcatorView(animating: false)
      self.view?.error(value: error)
    })
    
  }
  func recoveryAccountAction(){
    view?.recoverAccount()
  }
  
  func signUpAction(){
    view?.signUp()
  }
  
  func indicatorView(present: Bool){
    view?.indcatorView(animating: present)
  }
}
