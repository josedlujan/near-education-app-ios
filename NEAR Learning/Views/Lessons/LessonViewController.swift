//
//  LessonViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 02/12/21.
//

import UIKit
import NVActivityIndicatorView
class LessonViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  lazy var presenter = LessonPresenter(with: self)
  private var activityIndicator: NVActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    lessonsCallback()
  }
  
  private func setupUI(){
    title = "Lecciones"
    tableView.register(UINib(nibName: "LessonCell", bundle: nil), forCellReuseIdentifier: "LessonCell")
    setupActivityIndicator()
  }
  private func setupActivityIndicator(){
    activityIndicator = activityIndicator()
    view.addSubview(activityIndicator)
  }
  private func lessonsCallback(){
    presenter.indicatorView(present: true)
    presenter.getLessons{
      self.presenter.indicatorView(present: false)
      self.tableView.reloadData()
    }
  }
}

extension LessonViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.lessons.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "LessonCell", for: indexPath) as? LessonCell else {
      fatalError("")
    }
    let currentLesson = presenter.lessons[indexPath.row]
    cell.bindWithLesson(lesson: currentLesson)
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let screen = UIScreen.main.bounds
    return screen.height * 0.15
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let lesson = presenter.lessons[indexPath.row]
    let lessonDetailVC = LessonDetailViewController()
    lessonDetailVC.lesson = lesson
    navigationItem.backButtonTitle = ""
    navigationController?.pushViewController(lessonDetailVC, animated: true)
  }
}

extension LessonViewController: LessonPresenterView {
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
