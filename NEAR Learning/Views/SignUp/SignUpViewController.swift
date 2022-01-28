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
}

extension SignUpViewController: SignUpPresenterView {
  func signUp() {
    // implement code
  }
}
