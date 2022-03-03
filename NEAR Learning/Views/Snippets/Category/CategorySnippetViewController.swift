//
//  CategorySnippetViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 07/02/22.
//

import UIKit
import NVActivityIndicatorView
class CategorySnippetViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK:Properties
    lazy var presenter = SnippetPresenter(with: self)
    private var activityIndicator: NVActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        categorySnippetsCallback()
        
    }
    private func setupUI(){
      title = "Snippets"
      tableView.register(UINib(nibName: "TestCell", bundle: nil), forCellReuseIdentifier: "TestCell")
      setupActivityIndicator()
    }
    
    private func setupActivityIndicator(){
      activityIndicator = activityIndicator()
      view.addSubview(activityIndicator)
    }
    private func categorySnippetsCallback(){
      presenter.indicatorView(present: true)
      presenter.getCategorySnippets {
        self.presenter.indicatorView(present: false)
        self.tableView.reloadData()
      }
    }

}

extension CategorySnippetViewController:UITableViewDelegate,UITableViewDataSource{
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let snipetsVC = SnippetsViewController()
        snipetsVC.category = presenter.categories[indexPath.row]
        navigationController?.pushViewController(snipetsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      let screen = UIScreen.main.bounds
      return screen.height * 0.15
    }
}
extension CategorySnippetViewController:SnippetPresenterView{
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
