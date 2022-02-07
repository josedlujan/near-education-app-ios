//
//  NewsPresenter.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 29/01/22.
//

import Foundation

protocol NewsPresenterView:AnyObject{
  func showMessage(message: String)
  func indcatorView(animating: Bool)
}

class NewsPresenter{
  weak var view: NewsPresenterView?
  var news: [NewsItem] = []
  
  init(with view: NewsPresenterView) {
    self.view = view
  }
  
  func allNewsAction(onSuccess: @escaping() -> Void){
    NewsBO.getAllNews { [weak self] news, isError in
      if !isError{
        self?.news = news
        onSuccess()
      } else {
        self?.view?.indcatorView(animating: false)
        self?.view?.showMessage(message: "No se pudieron obtener las ultimas noticias")
      }
    }
  }
  
  func indicatorView(present: Bool){
    view?.indcatorView(animating: present)
  }
  
}
