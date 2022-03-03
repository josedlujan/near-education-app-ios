//
//  Store.swift
//  NEAR Learning
//
//  Created by Isaac R on 05/02/22.
//

import Foundation
import RealmSwift

class Store {
  static let sharedInstance = Store()
  let realm: Realm?
  
  private init() {
    do {
      self.realm = try Realm()
    } catch {
      self.realm = nil
    }
  }
  
  func deleteAllObjects() {
    do {
      let realm = try Realm()
      try realm.write {
        realm.deleteAll()
      }
    } catch {
      print("Unable to delete all objects")
    }
  }
  
  func all(object: Object.Type) -> Results<Object>? {
    if let results = realm?.objects(object) {
      return results
    } else {
      return nil
    }
  }
  
  func deleteAll(objects: Results<Object>) {
    for obj in objects {
      realm?.beginWrite()
      realm?.delete(obj)
      // swiftlint:disable:next force_try
      try! realm?.commitWrite()
    }
  }
  
  func save(object: Object) {
    do {
      try realm?.write {
        realm?.add(object)
      }
    } catch {
      print("Unable to save objects")
    }
  }
  
  func update(object: Object, value: Any, key: String) {
    do {
      try realm?.write {
        object.setValue(value, forKeyPath: key)
      }
    } catch {
      print("Unable to update object")
    }
  }
}
