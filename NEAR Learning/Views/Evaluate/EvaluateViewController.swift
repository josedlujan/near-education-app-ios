//
//  EvaluateViewController.swift
//  NEAR Learning
//
//  Created by Isaac R on 09/02/22.
//

import UIKit

protocol EvaluateDelegate: AnyObject {
  func popController()
}

class EvaluateViewController: UIViewController {
  lazy var presenter = EvaluatePresenter(with: self)
  @IBOutlet weak var correctLabel: UILabel!
  @IBOutlet weak var errorLabel: UILabel!
  var rigth = 0
  var fail = 0
  var currentLevel:LevelItem!
  let session = UserSession.sharedInstance
  weak var delegate: EvaluateDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  func setupUI() {
    correctLabel.text = String(rigth)
    errorLabel.text = String(fail)
  }
  
  @IBAction func saveAction(_ sender: UIButton) {
    guard let email = session.sessionData.email else {return}
    presenter.saveAnswers(answers: AnswerItem(userMail: email,
                                              rigthAnswers: rigth,
                                              failAnswers: fail,
                                              idCategory: currentLevel.idCategory,
                                              idLevel: currentLevel.id))
  }
}

extension EvaluateViewController: EvaluatePresenterView {
  func showMessage(message: String) {
    debugPrint(message)
  }
  
  func indicatorView(animating: Bool) {
    
  }
  
  func saveResult() {
    dismiss(animated: true, completion: {
    self.delegate?.popController()
    })
  }
}
