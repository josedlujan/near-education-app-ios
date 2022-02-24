//
//  TestViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 02/12/21.
//

import UIKit
import NVActivityIndicatorView

class TestViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  lazy var presenter = TestPresenter(with: self)
  private var activityIndicator: NVActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    testCallback()
    // Do any additional setup after loading the view.
  }
  
  private func setupUI(){
    tableView.register(UINib(nibName: "TestCell", bundle: nil), forCellReuseIdentifier: "TestCell")
    title = "Quiz"
    setupActivityIndicator()
  }
  
  private func setupActivityIndicator(){
    activityIndicator = activityIndicator()
    view.addSubview(activityIndicator)
  }
  
  private func testCallback(){
    presenter.indicatorView(present: true)
    presenter.getAllTest {
      self.presenter.indicatorView(present: false)
      self.tableView.reloadData()
    }
  }
  
}

extension TestViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.categories.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as? TestCell else {
      fatalError("")
    }
    let category = presenter.categories[indexPath.row]
    cell.bindWithCategory(category: category)
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let screen = UIScreen.main.bounds
    return screen.height * 0.15
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let category = presenter.categories[indexPath.row]
    let goalVC = GoalViewController()
    goalVC.idCategory = category.id
    navigationItem.backButtonTitle = ""
    navigationController?.pushViewController(goalVC, animated: true)
  }
}

extension TestViewController: TestPresenterView {
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
