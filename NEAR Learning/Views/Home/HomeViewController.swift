//
//  HomeViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 19/11/21.
//

import UIKit

class HomeViewController: UIViewController {
  lazy var presenter = NewsPresenter(with: self)
    var allNews:[NewsItem] = []
  @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      setupUI()
        presenter.allNewsAction()
        // Do any additional setup after loading the view.
    }
  
  private func setupUI(){
    tableView.register(UINib(nibName: "CoursesCell", bundle: nil), forCellReuseIdentifier: "CoursesCell")
    title = "Inicio"
  }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return allNews.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesCell", for: indexPath) as? CoursesCell else {
      fatalError("")
    }
      
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let screen = UIScreen.main.bounds
    return screen.height * 0.25
  }
}
extension HomeViewController:NewsPresenterView{
    func allNews(news: [NewsItem]) {
        self.allNews = news
        self.tableView.reloadData()
    }
    
    func showMessage(message: String) {
        debugPrint(message)
    }
    
    
}
