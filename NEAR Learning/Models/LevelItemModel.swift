//
//  LevelItemModel.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 03/02/22.
//

import Foundation
struct LevelItem:Codable{
    let id:String
    let idCategory:String
    let levelNumber:Int
    let levelDescription:String
    
    enum CodingKeys:String,CodingKey{
        case id
        case idCategory = "id_categoria"
        case levelNumber = "nivel_number"
        case levelDescription = "nivel_texto"
    }
}
