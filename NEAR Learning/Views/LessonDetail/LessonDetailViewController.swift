//
//  LessonDetailViewController.swift
//  NEAR Learning
//
//  Created by Isaac R on 08/02/22.
//

import UIKit

class LessonDetailViewController: UIViewController, LessonDetailPresenterView {
  func indicatorView(animating: Bool) {
  }
  
  @IBOutlet weak var tableView: UITableView!
  var lesson: LessonItem!
  lazy var presenter = LessonDetailPresenter(with: self)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI(){
    title = lesson.title
    tableView.register(UINib(nibName: "LessonDetailCell", bundle: nil), forCellReuseIdentifier: "LessonDetailCell")
    presenter.lesson = lesson
    tableView.reloadData()
  }

}

extension LessonDetailViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "LessonDetailCell", for: indexPath) as? LessonDetailCell else {fatalError("")}
    cell.bindWithLesson(lesson: presenter.lesson)
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return tableView.rowHeight
  }
}
