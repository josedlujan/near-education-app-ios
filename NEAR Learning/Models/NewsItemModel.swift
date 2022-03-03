//
//  NewsItemModel.swift
//  NEAR Learning
//
//  Created by Josue Hernandez on 29/01/22.
//

import Foundation

struct NewsItem:Codable{
    let date:String
    let id:String
    let link:String?
    let photo:String
    let resumen:String
    let title:String
}
