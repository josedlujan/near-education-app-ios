//
//  UINavigationController+Action.swift
//  NEAR Learning
//
//  Created by Isaac R on 19/11/21.
//

import UIKit

extension UINavigationController {
  func transparetNavigationBar() {
    navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    navigationBar.shadowImage = UIImage()
    navigationBar.isTranslucent = true
    view.backgroundColor = UIColor.clear
  }
}
