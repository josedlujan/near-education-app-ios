//
//  NewsBO.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 29/01/22.
//

import Foundation

class NewsBO {
  static let firebaseService = FirebaseService.shared
  
  static func getAllNews(callback: @escaping([NewsItem] ,Bool) -> Void) {
    self.firebaseService.db.collection("news").getDocuments(){(querySnapshot,err) in
      var news:[NewsItem] = []
      if let error = err{
        debugPrint("error al consultar las noticias \(error)")
        callback(news,true)
        return
      }
      guard let documents = querySnapshot?.documents else{
        debugPrint("No hay noticias")
        callback(news,true)
        return
      }
      
      for document in documents {
        do {
          let json = try JSONSerialization.data(withJSONObject: document.data())
          let decoder = JSONDecoder()
          let currentNewsItem = try decoder.decode(NewsItem.self, from: json)
          news.append(currentNewsItem)
        } catch {
          callback(news,true)
          print(error)
        }
      }
      callback(news,false)
    }
  }
}
