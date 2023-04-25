//
//  Character.swift
//  simpsonsviewer
//
//  Created by Nathan Kellert on 4/25/23.
//

import Foundation

struct ResponseData: Codable {
    let relatedTopics: [Character]
    
    enum CodingKeys: String, CodingKey {
        case relatedTopics = "RelatedTopics"
    }
}

struct Icon: Codable {
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url = "URL"
    }
}

struct Character: Codable {
    
    let text: String
    let icon: Icon
    
    var name: String {
        return text.components(separatedBy: " - ").first ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case text = "Text"
        case icon = "Icon"
    }
}
