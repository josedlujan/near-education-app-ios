//
//  SignupBO.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 27/01/22.
//

import FirebaseAuth
import Foundation
class SignupBO{
    
    func signup(email: String, password: String,callback:@escaping(_ result:Bool)->Void){
        Auth.auth().createUser(withEmail: email, password:password){authResul,error in
            if error == nil {
                callback(true)
            }
            else{
                callback(false)
            }
            
        }
    }
}
