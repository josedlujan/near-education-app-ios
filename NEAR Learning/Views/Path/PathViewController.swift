//
//  PathViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 02/12/21.
//

import UIKit
import NVActivityIndicatorView
class PathViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  lazy var presenter = PathPresenter(with: self)
  private var activityIndicator: NVActivityIndicatorView!
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI(){
    title = "Path"
    tableView.register(UINib(nibName: "PathCell", bundle: nil), forCellReuseIdentifier: "PathCell")
    setupActivityIndicator()
    pathsCallback()
  }
  private func setupActivityIndicator(){
    activityIndicator = activityIndicator()
    view.addSubview(activityIndicator)
  }
  private func pathsCallback(){
    presenter.indicatorView(present: true)
    presenter.getPathCateories{
      self.presenter.indicatorView(present: false)
      self.tableView.reloadData()
    }
  }
}

extension PathViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.categories.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "PathCell", for: indexPath) as? PathCell else {fatalError("")}
    let pathCategory = presenter.categories[indexPath.row]
    cell.bindWithPath(pathCategory: pathCategory)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let pathCategory = presenter.categories[indexPath.row]
    let PathDetailVC = PathDetailViewController()
    PathDetailVC.categoryId = pathCategory.id
    navigationItem.backButtonTitle = ""
    navigationController?.pushViewController(PathDetailVC, animated: true)
  }
  
}



extension PathViewController:PathPresenterView{
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
