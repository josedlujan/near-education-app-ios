//
//  UIView+Action.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 03/12/21.
//

import UIKit

extension UIView {
  func shadow() {
    layer.shadowRadius = 5
    layer.shadowOffset = .zero
    layer.shadowOpacity = 0.3
    layer.bounds = self.bounds
  }
}
