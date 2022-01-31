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
  
  func shadowAndRound(radius: CGFloat) {
    DispatchQueue.main.async {
      let path = UIBezierPath(roundedRect: self.bounds,
                              byRoundingCorners: [.allCorners],
                              cornerRadii: CGSize(width: radius, height: radius)).cgPath
      self.backgroundColor = UIColor.clear
      let shape = CAShapeLayer()
      shape.fillColor = UIColor.white.cgColor
      shape.shadowColor = UIColor.black.cgColor
      shape.shadowOpacity = 0.3
      shape.shadowOffset = CGSize(width: 0.0, height: 1.0)
      shape.shadowRadius = 2
      shape.rasterizationScale = UIScreen.main.scale
      shape.shouldRasterize = true
      shape.drawsAsynchronously = true
      shape.path = path
      self.layer.insertSublayer(shape, at: 0)
    }
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
