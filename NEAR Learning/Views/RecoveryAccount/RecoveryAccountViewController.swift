//
//  RecoveryAccountViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 19/11/21.
//

import UIKit
import NVActivityIndicatorView
class RecoveryAccountViewController: UIViewController {
  lazy var presenter = RecoveryAccountPresenter(with: self)
  private var activityIndicator: NVActivityIndicatorView!
  @IBOutlet weak var textFieldEmail: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI(){
    textFieldEmail.placeholderColor(.white)
    setupActivityIndicator()
  }
    private func setupActivityIndicator(){
      activityIndicator = activityIndicator()
      view.addSubview(activityIndicator)
    }
    
  @IBAction func recoveryAction(_ sender: UIButton) {
      activityIndicator().startAnimating()
      presenter.recoveyAction(email:textFieldEmail.text!)
  }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      view.endEditing(true)
    }
}

extension RecoveryAccountViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
      return true
    }
}
extension RecoveryAccountViewController: RecoveryAccountPresenterView {
    func error(value: String) {
        activityIndicator.stopAnimating()
        alert("Error", message: value, dismiss: "Aceptar")
    }
    
  func recovery() {
      activityIndicator.stopAnimating()
      alertHandler("Aviso", message: "Se ha enviado a tu correo los pasos para recuperar tu contraseña", dismiss: "Aceptar", completion: {[weak self]done in
          self?.navigationController?.popViewController(animated: false)
      })
  }
}
