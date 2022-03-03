//
//  LessonItemModel.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 03/02/22.
//

import Foundation
struct LessonItem:Codable{
    let id:String
    let title:String
    let article:String
    let author:String
    let date:String
    let photo:String
    
    enum CodingKeys:String,CodingKey{
        case id
        case title = "titulo"
        case article = "articulo"
        case author = "autor"
        case date = "fecha"
        case photo = "foto"
    }
}
