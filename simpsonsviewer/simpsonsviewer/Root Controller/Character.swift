//
//  Character.swift
//  simpsonsviewer
//
//  Created by Nathan Kellert on 4/25/23.
//

import Foundation

struct ResponseData: Codable {
    let relatedTopics: [Character]
}

struct Icon: Codable {
    let url: String
}

struct Character: Codable {
    
    let text: String
    let icon: Icon
    
    var name: String {
        return text.components(separatedBy: " - ").first ?? ""
    }
}
