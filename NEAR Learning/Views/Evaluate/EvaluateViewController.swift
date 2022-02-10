//
//  EvaluateViewController.swift
//  NEAR Learning
//
//  Created by Isaac R on 09/02/22.
//

import UIKit

class EvaluateViewController: UIViewController {
  lazy var presenter = EvaluatePresenter(with: self)
  @IBOutlet weak var correctLabel: UILabel!
  @IBOutlet weak var errorLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension EvaluateViewController: EvaluatePresenterView {
  func saveResult() {
    dismiss(animated: true, completion: nil)
  }
}
