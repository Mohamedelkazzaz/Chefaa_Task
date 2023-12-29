//
//  DetailsViewModelTests.swift
//  Chefaa_TaskTests
//
//  Created by Mohamed Elkazzaz on 29/12/2023.
//

import XCTest
@testable import Chefaa_Task

final class DetailsViewModelTests: XCTestCase {

    var viewModel: DetailsViewModel!
       
       override func setUp() {
           super.setUp()
           viewModel = DetailsViewModel()
       }
       
       override func tearDown() {
           viewModel = nil
           super.tearDown()
       }
       
       func testGetCharacters() {
           // Arrange
           let expectedCharacter = Character(id: 1, name: "John Doe", description: "Test Description", modified: "2023-12-28", resourceURI: "https://example.com/character", urls: [], thumbnail: nil, comics: nil, stories: nil, events: nil, series: nil)
           viewModel.character = expectedCharacter
           
           // Act
           let result = viewModel.getCharacters()
           
           // Assert
           XCTAssertEqual(result, expectedCharacter, "Returned character should be equal to the assigned character")
       }
       
       func testGetCharacter() {
           // Arrange
           let expectedCharacter = Character(id: 1, name: "John Doe", description: "Test Description", modified: "2023-12-28", resourceURI: "https://example.com/character", urls: [], thumbnail: nil, comics: nil, stories: nil, events: nil, series: nil)
           let indexPath = IndexPath(row: 0, section: 0)
           viewModel.character = expectedCharacter
           
           // Act
           let result = viewModel.getCharacter(indexPath: indexPath)
           
           // Assert
           XCTAssertEqual(result, expectedCharacter, "Returned character should be equal to the assigned character")
       }

}


