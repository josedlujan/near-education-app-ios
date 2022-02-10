//
//  LessonDetailPresenter.swift
//  NEAR Learning
//
//  Created by Isaac R on 08/02/22.
//

import Foundation
protocol LessonDetailPresenterView: AnyObject {
  func indicatorView(animating: Bool)
}
class LessonDetailPresenter {
    weak var view: LessonDetailPresenterView?
    var lesson: LessonItem!
    
    init(with view: LessonDetailPresenterView) {
      self.view = view
    }
    
    func indicatorView(present: Bool){
      view?.indicatorView(animating: present)
    }
}
