//
//  SnippetPresenter.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 07/02/22.
//

import Foundation
protocol SnippetPresenterView: AnyObject {
  func showMessage(message: String)
  func indicatorView(animating: Bool)
}
class SnippetPresenter{
    weak var view: SnippetPresenterView?
    var snippets: [SnippetItem] = []
    var categories:[CategoryItem] = []
    
    init(with view: SnippetPresenterView) {
      self.view = view
    }
    
    func getCategorySnippets(onSuccess:@escaping()->Void){
        SnippetsBO.getAllCaterories{[weak self] categories, isError in
            if !isError{
                self?.categories = categories
            }
            else{
                self?.view?.indicatorView(animating: false)
                self?.view?.showMessage(message: "No se pudieron obtener las categorias de los snippets")
            }
            onSuccess()
        }
    }
    func getSnippetsByCategory(categoryId:String,onSuccess:@escaping()->Void){
        SnippetsBO.getSnnipetByCategory(idCategory: categoryId){[weak self] snippets,isError in
            if !isError{
                self?.snippets = snippets
            }
            else{
                self?.view?.indicatorView(animating: false)
                self?.view?.showMessage(message: "No se pudieron obtener los snnipets")
            }
            onSuccess()
        }
    }
    
    func indicatorView(present: Bool){
      view?.indicatorView(animating: present)
    }
}
