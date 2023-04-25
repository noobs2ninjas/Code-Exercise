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
    let url: URL
    
    var characters:[Character]! {
        didSet {
            delegate.didRecieveCharacters()
        }
    }
    
    // Not sure how efficient this is. I just haven't done swift concurrency in an init function and wanted to try.
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
