//
//  LogOutViewController.swift
//  NEAR Learning
//
//  Created by Isaac R on 10/02/22.
//

import UIKit

class LogOutViewController: UIViewController {
  let store = Store.sharedInstance
  
    override func viewDidLoad() {
        super.viewDidLoad()
      title = "Cerrar sesión"
      logOut()
    }
  
  
  func deleteRealmObjects() {
    store.deleteAll(objects: store.all(object: Session.self)!)
    store.deleteAllObjects()
  }

  func logOut() {
    deleteRealmObjects()
    let root = RootViewController()
    root.modalPresentationStyle = .custom
    root.modalTransitionStyle = .crossDissolve
    if let window = UIApplication.shared.connectedScenes
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first {
      window.rootViewController = root
      window.makeKeyAndVisible()
    }
  }
}
