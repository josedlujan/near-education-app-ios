//
//  GoalViewController.swift
//  NEAR Learning
//
//  Created by Isaac R on 05/02/22.
//

import UIKit
import NVActivityIndicatorView

class GoalViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var idCategory: String = ""
  lazy var presenter = GoalPresenter(with: self)
  private var activityIndicator: NVActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    goalCallback()
  }
  
  private func setupUI(){
    tableView.register(UINib(nibName: "LevelCell", bundle: nil), forCellReuseIdentifier: "LevelCell")
    title = "Goal"
    setupActivityIndicator()
  }
  private func setupActivityIndicator(){
    activityIndicator = activityIndicator()
    view.addSubview(activityIndicator)
  }
  
  private func goalCallback() {
    presenter.getLevel(idCategory: idCategory) {
      self.presenter.indicatorView(present: false)
      self.tableView.reloadData()
    }
  }
  
}

extension GoalViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.levels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "LevelCell", for: indexPath) as? LevelCell else {fatalError("")}
    let level = presenter.levels[indexPath.row]
    cell.bindWithLevel(level: level)
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let screen = UIScreen.main.bounds
    return screen.height * 0.13
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let questionVC = QuestionViewController()
    let level = presenter.levels[indexPath.row]
    questionVC.idCategory = level.idCategory
    navigationController?.pushViewController(questionVC, animated: true)
  }
}


extension GoalViewController: GoalPresenterView {
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
