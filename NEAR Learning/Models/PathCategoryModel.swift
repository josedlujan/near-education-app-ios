//
//  PathCategoryModel.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 08/02/22.
//

import Foundation
struct PathCategoryItem:Codable{
    let id:String
    let title:String
    let active:Bool
    let order:Int
    
    enum CodingKeys:String,CodingKey{
        case id
        case title = "nombre"
        case active = "activo"
        case order = "num_orden"
    }
}
