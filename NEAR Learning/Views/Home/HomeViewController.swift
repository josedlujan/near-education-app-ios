//
//  HomeViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 19/11/21.
//

import UIKit
import NVActivityIndicatorView

class HomeViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  //lazy var presenter = NewsPresenter(with: self,newsBO: NewsBO(firebaseService: FirebaseService.shared))
  lazy var presenter = NewsPresenter(with: self)
  private var activityIndicator: NVActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    newsCallback()
    // Do any additional setup after loading the view.
  }
  
  private func setupUI(){
    tableView.register(UINib(nibName: "NewCell", bundle: nil), forCellReuseIdentifier: "NewCell")
    title = "Inicio"
    setupActivityIndicator()
  }
  
  private func setupActivityIndicator(){
    activityIndicator = activityIndicator()
    view.addSubview(activityIndicator)
  }
  
  private func newsCallback(){
    presenter.indicatorView(present: true)
    presenter.allNewsAction {
      self.presenter.indicatorView(present: false)
      self.tableView.reloadData()
    }
  }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.news.count//allNews.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewCell", for: indexPath) as? NewCell else {fatalError("")}
    let new = presenter.news[indexPath.row]
    cell.bindWithNew(new: new)
    debugPrint(new)
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let screen = UIScreen.main.bounds
    return screen.height * 0.2
  }
}

extension HomeViewController: NewsPresenterView {
  func indcatorView(animating: Bool) {
    switch animating{
    case true:
      activityIndicator.startAnimating()
    case false:
      activityIndicator.stopAnimating()
    }
  }
  
  func showMessage(message: String) {
    debugPrint(message)
  }
}
