//
//  PathDetailViewController.swift
//  NEAR Learning
//
//  Created by Isaac R on 10/02/22.
//

import UIKit
import NVActivityIndicatorView

class PathDetailViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  lazy var presenter = PathDetailPresenter(with: self)
  private var activityIndicator: NVActivityIndicatorView!
  var categoryId: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    pathsCallback()
  }
  
  private func setupUI(){
    tableView.register(UINib(nibName: "PathDetailCell", bundle: nil), forCellReuseIdentifier: "PathDetailCell")
    setupActivityIndicator()
  }
  
  private func setupActivityIndicator(){
    activityIndicator = activityIndicator()
    view.addSubview(activityIndicator)
  }
  
  private func pathsCallback(){
    presenter.indicatorView(present: true)
    presenter.getPathsByCategory(idCategory: categoryId) {
      self.presenter.indicatorView(present: false)
      self.tableView.reloadData()
    }
  }
}

extension PathDetailViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.paths.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "PathDetailCell", for: indexPath) as? PathDetailCell else {fatalError("")}
    let path = presenter.paths[indexPath.row]
    cell.bindWithPath(path: path)
    cell.delegate = self
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return tableView.rowHeight
  }
}

extension PathDetailViewController: PathDetailPresenterView {
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

extension PathDetailViewController: PathDetailDelegate {
  func goCourse(url: String) {
    let urlOpen = URL(string: url)
    openSafariVC(url: urlOpen!)
  }
}
