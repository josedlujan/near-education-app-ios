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
    let newsBO:NewsBO = NewsBO(firebaseService: FirebaseService.shared)
    init(with view: NewsPresenterView) {
    self.view = view
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
  }
    
     //Mark : TODO Remover cuando no se use
    func test(){
        let questionBO = QuestionBO(firebaseService: FirebaseService.shared)
        questionBO.getQuestionsByCategory(idCategory: "1SdLBR6NtVV9C4qQAOnS"){[weak self]questions,isError in
            if !isError{
                debugPrint("Estas son las preguntas: \(questions)")
            }
            else{
                self?.view?.showMessage(message: "No se pudieron obtener las preguntas")
            }
        }
    }
}
