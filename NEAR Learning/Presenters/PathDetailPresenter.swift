//
//  PathDetailPresenter.swift
//  NEAR Learning
//
//  Created by Isaac R on 10/02/22.
//

import Foundation

protocol PathDetailPresenterView: AnyObject {
  func showMessage(message: String)
  func indicatorView(animating: Bool)
}

class PathDetailPresenter{
  weak var view: PathDetailPresenterView?
  var paths: [PathItem] = []
  
  init(with view: PathDetailPresenterView) {
    self.view = view
  }
  
  func getPathsByCategory(idCategory:String, onSuccess: @escaping() -> Void) {
    PathBO.getPatsByCategory(idCategory: idCategory){[weak self] paths,isError in
      if !isError{
        self?.paths = paths
      } else{
        self?.view?.indicatorView(animating: false)
        self?.view?.showMessage(message: "No se pudieron obtener los paths")
      }
      onSuccess()
    }
  }
  
  func indicatorView(present: Bool){
    view?.indicatorView(animating: present)
  }
  
}
