//
//  PathItemModel.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 08/02/22.
//

import Foundation
struct PathItem:Codable{
    let idCategory:String
    let description:String
    let difficulty:String
    let lifeTime:String
    let url:String
    let level:String
    let title:String
    let requirements:[String]
    
    enum CodingKeys:String,CodingKey{
        case idCategory = "id_categoria"
        case description = "descripcion"
        case difficulty = "dificultad"
        case lifeTime = "duracion"
        case url = "link"
        case level = "nivel"
        case title = "nombre"
        case requirements = "requisitos"
    }
}
