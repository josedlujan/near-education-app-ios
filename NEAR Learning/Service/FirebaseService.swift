//
//  FirebaseService.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 03/02/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
class FirebaseService{
    let settings = FirestoreSettings()
    var db: Firestore!
    static let shared = FirebaseService()
    
    private  init() {
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
}
