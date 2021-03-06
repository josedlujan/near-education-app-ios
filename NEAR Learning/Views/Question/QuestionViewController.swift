//
//  QuestionViewController.swift
//  NEAR Learning
//
//  Created by Isaac R on 05/02/22.
//

import UIKit
import NVActivityIndicatorView

protocol QuestionDelegate: AnyObject{
  func reloadData()
}

class QuestionViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  lazy var presenter = QuestionPresenter(with: self)
  private var activityIndicator: NVActivityIndicatorView!
  var currentLevel:LevelItem!
  weak var delegate: QuestionDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    questionsCallback()
  }
  
  func setupUI() {
    title = "Nivel \(currentLevel.levelNumber)"
    tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell")
    tableView.register(UINib(nibName: "AnswerCell", bundle: nil), forCellReuseIdentifier: "AnswerCell")
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 44.0
    setupActivityIndicator()
  }
  
  private func setupActivityIndicator(){
    activityIndicator = activityIndicator()
    view.addSubview(activityIndicator)
  }
  
  private func questionsCallback() {
      presenter.getQuesions(idCategory: currentLevel.idCategory, level: currentLevel.id) {
      self.presenter.indicatorView(present: false)
      self.tableView.reloadData()
    }
  }
    
  @IBAction func evaluateAction(_ sender: UIButton) {
    let evaluation = Evaluate.evaluateQuiz(categoryId: currentLevel.idCategory, levelId: currentLevel.id)
    if evaluation.count == presenter.questionsCount {
      let evaluateVC = EvaluateViewController()
      evaluateVC.fail = evaluation.fail
      evaluateVC.rigth = evaluation.rigth
      evaluateVC.delegate = self
      evaluateVC.currentLevel = currentLevel
      evaluateVC.modalPresentationStyle = .fullScreen
      present(evaluateVC, animated: true, completion: nil)
    } else {
    
    }
  }

}

extension QuestionViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return presenter.questions.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell",
                                                     for: indexPath) as? QuestionCell else {fatalError("")}
      let question = presenter.questions[indexPath.section]
      cell.bindWithQuestion(question: question.question)
      return cell
    default:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell",
                                                     for: indexPath) as? AnswerCell else {fatalError("")}
      cell.bindWithAnswers(questions: presenter.questions, indexPath: indexPath, answerTemp: presenter.answerTemp)
      cell.delegate = self
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.row {
    case 0:
      return tableView.rowHeight
    default:
      return sizeCellByElements(indexPath: indexPath)
    }
  }
  
  func sizeCellByElements(indexPath: IndexPath) -> CGFloat {
    let answersCount = presenter.questions[indexPath.section].answers.count
    if answersCount == 1{
      return 55
    } else if answersCount == 2{
      return 110
    } else if answersCount == 3{
      return 160
    } else if answersCount == 4{
      return 220
    } else if answersCount == 5{
      return 270
    } else {
      return 160
    }
  }
  
}

extension QuestionViewController: QuestionPresenterView {
  func showMessage(message: String) {
    debugPrint(message)
  }
  
  func indicatorView(animating: Bool) {
    switch animating{
    case true:
      activityIndicator.startAnimating()
    case false:
      activityIndicator.stopAnimating()
    }
  }
}

extension QuestionViewController: AnswerCellDelegate {
  func answer(section: Int, answer: String) {
    presenter.answer(section: section, answer: answer)
    let row = IndexPath(row: 1, section: section)
    tableView.reloadRows(at: [row], with: .none)
    //tableView.reloadSections(IndexSet(integer: section), with: .none)
  }
}


extension QuestionViewController: EvaluateDelegate {
  func popController() {
    navigationController?.popViewController(animated: false)
    delegate?.reloadData()
  }
}
