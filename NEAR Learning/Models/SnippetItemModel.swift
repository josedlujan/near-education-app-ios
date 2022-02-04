//
//  SnippetItemModel.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 03/02/22.
//

import Foundation
struct SnippetItem:Codable{
    let id:Int
    let code:String
    let idCategory:String
    let title:String
    
    enum CodingKeys:String,CodingKey{
        case id = "num_snippets"
        case code = "codigo"
        case idCategory = "id_categoria"
        case title = "titulo"
    }
}
