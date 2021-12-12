//
//  RootViewController.swift
//  NEAR Learning
//
//  Created by Isaac R on 19/11/21.
//

import UIKit

class RootViewController: UIViewController {
  lazy var homeViewController = setupHomeController()
  lazy var loginViewController = setupLoginController()
  var observer: AnyObject?

  override func viewDidLoad() {
    super.viewDidLoad()
    setupAuthNotification()
    //showHomeScreen()
    showLoginScreen()
  }

  func setupAuthNotification() {
    let notification = NotificationCenter.default
    observer = notification.addObserver(forName: Notification.Name(rawValue: "successfullyLogin"),
                                        object: nil, queue: nil) {[weak self] _ in
                                          self?.showHomeScreen()
                                          self?.navigationController?.popToRootViewController(animated: false)

    }
  }

  func setupHomeController() -> UIViewController {
    let tabBarVC = TabBarViewController()
    tabBarVC.view.frame = view.bounds
    return tabBarVC
  }

  func setupLoginController() -> UIViewController {
    let loginVC = LoginViewController()
    loginVC.view.frame = view.bounds
    let navigationController = UINavigationController(rootViewController: loginVC)
    navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    navigationController.navigationBar.topItem?.title = ""
    navigationController.navigationBar.isTranslucent = false
    navigationController.navigationBar.tintColor = .white
    navigationController.transparetNavigationBar()
    return navigationController
  }

  func showHomeScreen() {
    addChild(homeViewController)
    view.addSubview(homeViewController.view)
    homeViewController.didMove(toParent: self)
  }

  func showLoginScreen() {
    addChild(loginViewController)
    view.addSubview(loginViewController.view)
    loginViewController.didMove(toParent: self)
  }

}
