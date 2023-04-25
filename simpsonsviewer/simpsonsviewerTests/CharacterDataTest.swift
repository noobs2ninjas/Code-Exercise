//
//  simpsonsviewerTests.swift
//  simpsonsviewerTests
//
//  Created by Nathan Kellert on 4/25/23.
//

import XCTest
@testable import simpsonsviewer

final class CharacterDataTest: XCTestCase {
    
    
    typealias expectationCompletion = () -> Bool
    
    var charactersTableViewModel: CharactersTableViewModel?
    
    override func setUp() async throws {
        let url = Bundle.main.url(forResource: "data", withExtension: "json")!
        do {
            charactersTableViewModel = try await CharactersTableViewModel(delegate: self, url: url)
        }
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testCharacterTableViewModel() throws {
        if let charactersTableViewModel {
            XCTAssert(charactersTableViewModel.characters.count > 0, "More than 1 character parsed")
        }
        XCTAssert(false, "CharactersTableViewModelNil")
        
    }

}

extension CharacterDataTest: CharactersTableViewModelDelegate {
    func didRecieveCharacters() {
        
    }
}


