//
//  UITextField+Action.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 19/11/21.
//

import UIKit

extension UITextField {
  fileprivate func setPasswordToggleImage(_ button: UIButton) {
    if isSecureTextEntry{
      button.setImage(UIImage(named: "icnEyeHide"), for: .normal)
    }else{
      button.setImage(UIImage(named: "icnEyeShow"), for: .normal)
    }
  }
  
  func enablePasswordToggle(){
    let button = UIButton(type: .custom)
    setPasswordToggleImage(button)
    button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
    rightView = button
    rightViewMode = .always
  }
  
  @IBAction func togglePasswordView(_ sender: UIButton) {
    self.isSecureTextEntry = !self.isSecureTextEntry
    setPasswordToggleImage(sender)
  }
  
  func placeholderColor(_ color: UIColor){
      var placeholderText = ""
      if self.placeholder != nil{
          placeholderText = self.placeholder!
      }
    self.attributedPlaceholder = NSAttributedString(string: placeholderText,
                                                    attributes: [NSAttributedString.Key.foregroundColor : color])
  }
}
