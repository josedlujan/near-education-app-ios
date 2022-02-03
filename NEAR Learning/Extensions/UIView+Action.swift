//
//  UIView+Action.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 03/12/21.
//

import UIKit

extension UIView {
  func shadow(radious: CGFloat = 5) {
    layer.shadowRadius = radious
    layer.shadowOffset = .zero
    layer.shadowOpacity = 0.3
    layer.bounds = self.bounds
  }
  
  func setShadow() {
    layer.cornerRadius = 20
    layer.borderWidth = 3.0
    layer.borderColor =  #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 0)
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = CGSize.zero
    layer.shadowOpacity = 0.3
    layer.shadowRadius = 3.0
  }
  
  func roundConers(radius: CGFloat, corner: UIRectCorner) {
    DispatchQueue.main.async {
      let path = UIBezierPath(roundedRect: self.bounds,
                              byRoundingCorners: corner,
                              cornerRadii: CGSize(width: radius, height: radius))
      let shape = CAShapeLayer()
      shape.path = path.cgPath
      self.layer.mask = shape
    }
  }
}
