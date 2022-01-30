//
//  SignUpViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 19/11/21.
//

import UIKit

class SignUpViewController: UIViewController {
  lazy var presenter = SignUpPresenter(with: self)
  @IBOutlet weak var textFieldName: UITextField!
  @IBOutlet weak var textFieldEmail: UITextField!
  @IBOutlet weak var textFieldPassword: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI(){
    textFieldEmail.placeholderColor(.white)
    textFieldName.placeholderColor(.white)
    textFieldPassword.placeholderColor(.white)
    textFieldPassword.enablePasswordToggle()
  }
  
  @IBAction func signUpAction(_ sender: UIButton) {
      presenter.signUpAction(name:textFieldName.text!, email:textFieldEmail.text!, password: textFieldPassword.text!)
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
}

extension SignUpViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == textFieldName {
      textFieldEmail.becomeFirstResponder()
    } else if textField == textFieldEmail {
      textFieldPassword.becomeFirstResponder()
    } else if textField == textFieldPassword {
      textFieldPassword.resignFirstResponder()
    }
    return true
  }
}


extension SignUpViewController: SignUpPresenterView {
  func error(value: String) {
    alert("Error", message: value, dismiss: "Aceptar")
  }
  
  func signUp() {
    self.view.endEditing(true)
    let notification = NotificationCenter.default
    notification.post(name: Notification.Name(rawValue: "successfullyLogin"),
    object: nil,
    userInfo: nil)
  }
}
