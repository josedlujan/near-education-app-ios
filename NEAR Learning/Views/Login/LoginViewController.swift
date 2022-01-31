//
//  LoginViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 19/11/21.
//

import UIKit

class LoginViewController: UIViewController {
  @IBOutlet weak var textFieldEmail: UITextField!
  @IBOutlet weak var textFieldPassword: UITextField!
  @IBOutlet weak var checkImage: UIImageView!
  @IBOutlet weak var stkRecover: UIStackView!
  lazy var presenter = LoginPresenter(with: self)
  private var isEnable: Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textFieldPassword.enablePasswordToggle()
    setupRecoverAccount()
    textFieldEmail.text = "isaac@gmail.com"
    textFieldPassword.text = "1234qwer"
    // Do any additional setup after loading the view.
  }
  
  private func setupRecoverAccount(){
    let tap = UITapGestureRecognizer(target: self, action: #selector(tapGesture(gesture:)))
    stkRecover.addGestureRecognizer(tap)
  }
  
  @objc func tapGesture(gesture: UITapGestureRecognizer){
    switch isEnable {
    case true:
      checkImage.image = UIImage(named:"icnCheckOff")
      isEnable = !isEnable
    case false:
      checkImage.image = UIImage(named:"icnCheckOn")
      isEnable = !isEnable
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
  @IBAction func loginAction(_ sender: UIButton) {
    presenter.loginAction(email: textFieldEmail.text!, password: textFieldPassword.text!)
  }
  @IBAction func recoverAccount(_ sender: UIButton) {
    presenter.recoveryAccountAction()
  }
  @IBAction func signUpAction(_ sender: UIButton) {
    presenter.signUpAction()
  }
}

extension LoginViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == textFieldEmail {
      textFieldPassword.becomeFirstResponder()
    } else if textField == textFieldPassword {
      textFieldPassword.resignFirstResponder()
    }
    return true
  }
}


extension LoginViewController: LoginPresenterView {
  func error(value: String) {
    alert("Error", message: value, dismiss: "Aceptar")
  }
  
  func login() {
    let notification = NotificationCenter.default
    notification.post(name: Notification.Name(rawValue: "successfullyLogin"),
            object: nil,
            userInfo: nil)
  }
  func recoverAccount() {
    let recoveryVC = RecoveryAccountViewController()
    navigationController?.pushViewController(recoveryVC, animated: true)
  }
  
  func signUp() {
    let signUpViewController = SignUpViewController()
    navigationController?.pushViewController(signUpViewController, animated: true)
  }
  
}
