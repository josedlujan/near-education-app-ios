//
//  RecoveryAccountViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 19/11/21.
//

import UIKit

class RecoveryAccountViewController: UIViewController {
  lazy var presenter = RecoveryAccountPresenter(with: self)
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }

  @IBAction func recoveryAction(_ sender: UIButton) {
    presenter.recoveyAction(email: "")
  }
}


extension RecoveryAccountViewController: RecoveryAccountPresenterView {
  func recovery() {
    // implemented code
  }
}
