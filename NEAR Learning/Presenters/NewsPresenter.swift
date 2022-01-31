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
  init(with view: NewsPresenterView) {
    self.view = view
  }
  
  func allNewsAction(onSuccess: @escaping() -> Void){
    let newsBO = NewsBO()
    newsBO.getAllNews{[weak self] news,isError in
      if !isError{
        self?.news = news
        onSuccess()
      }
      else{
        self?.view?.showMessage(message: "No se pudieron obtener las ultimas noticias")
      }
    }
  }
}
