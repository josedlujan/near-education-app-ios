//
//  UserSession.swift
//  NEAR Learning
//
//  Created by Isaac R on 10/02/22.
//

import Foundation

class UserSession {
  static let sharedInstance = UserSession()
  var data = Store.sharedInstance.all(object: Session.self)!


  var sessionData: Session {
    guard let sessionData = self.data.first as? Session else {return Session()}
    return sessionData
  }

  private init () {}
}
