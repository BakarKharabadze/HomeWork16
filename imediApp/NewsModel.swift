//
//  NewsModel.swift
//  imediApp
//
//  Created by Bakar Kharabadze on 4/19/24.
//

struct NewsResponse: Decodable {
    let news: [News]
    
    enum CodingKeys: String, CodingKey {
        case news = "List"
    }
}

struct News: Decodable {
    let title: String
    let time: String
    let url: String
    let type: Int
    let photoURL: String?
    let photoAlt: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case time = "Time"
        case url = "Url"
        case type = "Type"
        case photoURL = "PhotoUrl"
        case photoAlt = "PhotoAlt"
    }
}
