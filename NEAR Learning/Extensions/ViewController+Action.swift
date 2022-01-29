//
//  ViewController+Action.swift
//  NEAR Learning
//
//  Created by Isaac R on 29/01/22.
//

import UIKit

extension UIViewController {
  func alert(_ title: String, message: String, dismiss: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: dismiss, style: .default, handler: nil)
    alertController.addAction(alertAction)
    present(alertController, animated: true, completion: nil)
  }
}
