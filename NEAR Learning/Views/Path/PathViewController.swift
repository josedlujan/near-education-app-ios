//
//  PathViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 02/12/21.
//

import UIKit
import NVActivityIndicatorView
class PathViewController: UIViewController {
    
    lazy var presenter = PathPresenter(with: self)
    private var activityIndicator: NVActivityIndicatorView!
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI(){
    title = "Path"
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
        //self.tableView.reloadData()
      }
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
