//
//  NewsPresenter.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 29/01/22.
//

import Foundation
protocol NewsPresenterView:AnyObject{
    func allNews(news:[NewsItem])
    func showMessage(message:String)
}

class NewsPresenter{
    weak var view: NewsPresenterView?
    init(with view: NewsPresenterView) {
      self.view = view
    }
    func allNewsAction(){
        let newsBO = NewsBO()
        newsBO.getAllNews{[weak self] news,isError in
            if !isError{
                self?.view?.allNews(news:news)
            }
            else{
                self?.view?.showMessage(message: "No se pudieron obtener las ultimas noticias")
            }
        }
    }
    
}
