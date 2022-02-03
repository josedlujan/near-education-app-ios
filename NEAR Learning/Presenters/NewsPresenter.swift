//
//  NewsPresenter.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 29/01/22.
//

import Foundation
protocol NewsPresenterView:AnyObject{
  func showMessage(message:String)
}

class NewsPresenter{
  weak var view: NewsPresenterView?
  var news: [NewsItem] = []
  let newsBO:NewsBO!
    init(with view: NewsPresenterView,newsBO:NewsBO) {
    self.view = view
    self.newsBO = newsBO
  }
  
  func allNewsAction(onSuccess: @escaping() -> Void){
    self.newsBO.getAllNews{[weak self] news,isError in
      if !isError{
        self?.news = news
        onSuccess()
      }
      else{
        self?.view?.showMessage(message: "No se pudieron obtener las ultimas noticias")
      }
    }
      //self.newsBO.getAllQuestions()
  }
}
