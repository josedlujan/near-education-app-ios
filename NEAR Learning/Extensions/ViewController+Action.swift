//
//  ViewController+Action.swift
//  NEAR Learning
//
//  Created by Isaac R on 29/01/22.
//

import UIKit
import NVActivityIndicatorView
import SafariServices
extension UIViewController {
  func alert(_ title: String, message: String, dismiss: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: dismiss, style: .default, handler: nil)
    alertController.addAction(alertAction)
    present(alertController, animated: true, completion: nil)
  }
    
    func alertHandler(_ title: String, message: String,dismiss: String, completion: @escaping (UIAlertAction) -> Void ){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title:dismiss, style: .default, handler: completion)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
  
  func activityIndicator() -> NVActivityIndicatorView {
    let screen = UIScreen.main.bounds
    let pointX = screen.width / 2 - 30
    let pointY = screen.height / 2 - 30
    let frame = CGRect(x: pointX, y: pointY, width: 60, height: 60)
    let activityIndicator = NVActivityIndicatorView(frame: frame, type: .ballClipRotatePulse,
                                                    color: UIColor(red: 98/255, green: 0/255, blue: 238/255, alpha: 1),
                                                    padding: 2)
    return activityIndicator
  }
    func openSafariVC(url:URL){
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
}
