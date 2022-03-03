//
//  Session.swift
//  NEAR Learning
//
//  Created by Isaac R on 05/02/22.
//

import Foundation
import RealmSwift

class Session: Object {
  static let store = Store.sharedInstance
  @objc dynamic var token: String?
  @objc dynamic var email: String?

  static func create(token: String, email: String) {
    let session = Session()
    session.token = token
    session.email = email
    store.save(object: session)
  }
  
  static func hasSession() -> Bool {
    if let results = store.all(object: Session.self), results.count > 0 {
      return true
    } else {
      return false
    }
  }
}
