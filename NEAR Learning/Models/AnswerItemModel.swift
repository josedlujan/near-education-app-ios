//
//  AnswerModel.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 08/02/22.
//

import Foundation
struct AnswerItem:Codable{
    let userMail:String
    let rigthAnswers:Int
    let failAnswers:Int
    let idCategory:String
    let idLevel:String
    
    enum CodingKeys:String,CodingKey{
        case userMail = "email"
        case rigthAnswers = "correctos"
        case failAnswers = "errores"
        case idCategory = "id_Categoria"
        case idLevel = "id_nivel"
    }
}
