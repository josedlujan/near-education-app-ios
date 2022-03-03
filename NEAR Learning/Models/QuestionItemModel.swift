//
//  QuestionItemModel.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 03/02/22.
//

import Foundation
struct QuestionItem:Codable{
    let id:Int
    let idCategory:String
    let idLevel:String
    let question:String
    let answer:String
    let answers:[String]
    
    enum CodingKeys:String,CodingKey{
        case id = "num_pregunta"
        case idCategory = "id_categoria"
        case idLevel = "id_nivel"
        case question = "pregunta"
        case answer = "respuesta_correcta"
        case answers = "Respuestas"
    }
}
