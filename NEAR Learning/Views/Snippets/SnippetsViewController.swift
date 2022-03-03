//
//  SnippetsViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 07/02/22.
//

import UIKit
import NVActivityIndicatorView
class SnippetsViewController: UIViewController {
    // MARK:Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    lazy var presenter:SnippetPresenter = SnippetPresenter(with: self)
    private var activityIndicator: NVActivityIndicatorView!
    var category:CategoryItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        snippetsByCategoryCallback()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI(){
      title = category.name
      tableView.register(UINib(nibName: "LevelCell", bundle: nil), forCellReuseIdentifier: "LevelCell")
      setupActivityIndicator()
    }

    
    private func setupActivityIndicator(){
      activityIndicator = activityIndicator()
      view.addSubview(activityIndicator)
    }
    private func snippetsByCategoryCallback(){
      presenter.indicatorView(present: true)
        presenter.getSnippetsByCategory(categoryId: category.id) {
        self.presenter.indicatorView(present: false)
        self.tableView.reloadData()
      }
    }
}

extension SnippetsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.snippets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LevelCell", for: indexPath) as? LevelCell else {
          fatalError("")
        }
        let snippet = presenter.snippets[indexPath.row]
        cell.bindWithSnippet(snippet: snippet)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let snipetVC = SnippetViewController()
        snipetVC.snippet = presenter.snippets[indexPath.row]
        navigationController?.pushViewController(snipetVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      let screen = UIScreen.main.bounds
      return screen.height * 0.15
    }
    
    
}

extension SnippetsViewController:SnippetPresenterView{
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
