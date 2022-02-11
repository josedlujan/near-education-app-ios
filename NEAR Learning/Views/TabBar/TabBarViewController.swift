//
//  TabBarViewController.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 27/11/21.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createViewControllers()
    self.delegate = self
    selectedIndex = 0
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tabBar.tintColor = .white
    tabBar.unselectedItemTintColor = .lightGray
    tabBar.barTintColor = UIColor(named: "GeneralColor")
    view.backgroundColor = UIColor(named: "GeneralColor")
  }
  
  
  func createViewControllers() {
    let tabHome = tabItem(viewController: HomeViewController(), title: "Inicio", image: UIImage(named: "icnHome")!)
    let tabPath = tabItem(viewController: PathViewController(), title: "Path", image: UIImage(named: "icnPath")!)
    let tabSnippets = tabItem(viewController:CategorySnippetViewController(), title: "Snippets", image: UIImage(named: "icnSnippets")!)
    let tabLessons = tabItem(viewController: LessonViewController(), title: "Lecciones", image: UIImage(named: "icnLessons")!)
    let tabTest = tabItem(viewController: TestViewController(), title: "Test", image: UIImage(named: "icnTest")!)
    let tabLogOut = tabItem(viewController: LogOutViewController(), title: "Cerrar sesión", image: UIImage(named: "icnLogOut")!)
    self.viewControllers = [tabHome, tabPath, tabSnippets, tabLessons, tabTest, tabLogOut]
  }
  
  func tabItem(viewController: UIViewController, title: String, image: UIImage) -> UIViewController {
    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.view.frame = view.bounds
    navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    navigationController.navigationBar.topItem?.title = ""
    navigationController.navigationBar.tintColor = .white
    navigationController.navigationBar.barTintColor = UIColor(named: "GeneralColor")
    navigationController.tabBarItem = UITabBarItem()
    navigationController.tabBarItem.title = title
    navigationController.tabBarItem.image = image
    navigationController.navigationBar.isTranslucent = false
    navigationController.transparetNavigationBar()
    return navigationController
  }
  
}
