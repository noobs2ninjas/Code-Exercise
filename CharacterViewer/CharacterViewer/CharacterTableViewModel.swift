//
//  CharacterTableViewModel.swift
//  simpsonsviewer
//
//  Created by Nathan Kellert on 4/25/23.
//

import Foundation

protocol CharactersTableViewModelDelegate {
    func didRecieveCharacters()
}

class CharactersTableViewModel {
    
    let delegate: CharactersTableViewModelDelegate
    
    var characters = [Character]() {
        didSet {
            delegate.didRecieveCharacters()
        }
    }
    
    let url: URL!
    
    init(delegate: CharactersTableViewModelDelegate, url: URL) async throws {
        self.delegate = delegate
        self.url = url
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let responseData = try decoder.decode(ResponseData.self, from: data)
            characters = responseData.relatedTopics
        } catch {
            throw error
        }
    }
    
}
