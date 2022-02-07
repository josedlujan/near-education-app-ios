//
//  SignupBO.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 27/01/22.
//

import FirebaseAuth
import Foundation
class SignupBO {
  
  func signup(email: String, password: String, onSuccess: @escaping() -> Void,
              onFailure: @escaping(_ error: String) -> Void){
    Auth.auth().createUser(withEmail: email, password:password){ authResul, error in
      if error == nil {
        onSuccess()
      } else{
        guard let errorLocalized = error else {return}
        onFailure(errorLocalized.localizedDescription)
      }
      
    }
  }
  
  func signIn(email: String, password: String, onSuccess: @escaping() -> Void,
              onFailure: @escaping(_ error: String) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
      if error == nil {
        guard let result = authResult else {return}
        Session.create(token: result.user.uid)
        onSuccess()
      } else{
        guard let errorLocalized = error else {return}
        onFailure(errorLocalized.localizedDescription)
      }
    }
  }
}
