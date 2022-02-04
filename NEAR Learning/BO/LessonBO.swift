//
//  LessonBO.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 03/02/22.
//

import Foundation
class LessonBO{
    let firebaseService:FirebaseService!
    init(firebaseService:FirebaseService) {
        self.firebaseService = firebaseService
    }
    
    func getAllLessons(callback:@escaping([LessonItem],Bool)->Void){
        self.firebaseService.db.collection("Lecciones").getDocuments(){(querySnapshot,err) in
            var lessons:[LessonItem] = []
                if let error = err{
                    debugPrint("error al consultar las lecciones \(error)")
                    callback(lessons,true)
                    return
                }
                guard let documents = querySnapshot?.documents else{
                   debugPrint("No hay lecciones")
                    callback(lessons,true)
                    return
                }
               
                for document in documents {
                    do {
                        let json = try JSONSerialization.data(withJSONObject: document.data())
                        let decoder = JSONDecoder()
                        let currentLessonItem = try decoder.decode(LessonItem.self, from: json)
                        lessons.append(currentLessonItem)
                    } catch {
                        callback(lessons,true)
                        print(error)
                    }
                }
             callback(lessons,false)
            }
    }
}
