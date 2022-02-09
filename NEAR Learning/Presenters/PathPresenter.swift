//
//  PathPresenter.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 08/02/22.
//

import Foundation
protocol PathPresenterView: AnyObject {
  func showMessage(message: String)
  func indicatorView(animating: Bool)
}

class PathPresenter{
    weak var view: PathPresenterView?
    var paths: [PathItem] = []
    var categories:[PathCategoryItem] = []
    
    init(with view: PathPresenterView) {
      self.view = view
    }
    func getPathCateories(onSuccess:@escaping()->Void){
        PathBO.getAllCategories{[weak self] categories,isError in
            if !isError{
                self?.categories = categories
            }
            else{
                self?.view?.indicatorView(animating: false)
                self?.view?.showMessage(message: "No se pudieron obtener las categorias de los paths")
            }
            onSuccess()
        }
    }
    
    func getPathsByCategory(idCategory:String,onSuccess:@escaping()->Void){
        PathBO.getPatsByCategory(idCategory: idCategory){[weak self] paths,isError in
            if !isError{
                self?.paths = paths
            }
            else{
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
