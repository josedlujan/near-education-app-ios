//
//  LessonPresenter.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 07/02/22.
//

import Foundation
protocol LessonPresenterView: AnyObject {
  func showMessage(message: String)
  func indicatorView(animating: Bool)
}
class LessonPresenter{
    weak var view: LessonPresenterView?
    var lessons: [LessonItem] = []
    
    init(with view: LessonPresenterView) {
      self.view = view
    }
    
    func getLessons(onSuccess: @escaping() -> Void){
        LessonBO.getAllLessons{[weak self]lessons,isError in
            if !isError{
                self?.lessons = lessons
            }
            else{
                self?.view?.indicatorView(animating: false)
                self?.view?.showMessage(message: "No se pudieron obtener las lecciones")
            }
            onSuccess()
        }
    }
    
    func indicatorView(present: Bool){
      view?.indicatorView(animating: present)
    }
}
