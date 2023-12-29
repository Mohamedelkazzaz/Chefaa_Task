//
//  CharactersViewModelTests.swift
//  Chefaa_TaskTests
//
//  Created by Mohamed Elkazzaz on 29/12/2023.
//

import XCTest
@testable import Chefaa_Task

final class CharactersViewModelTests: XCTestCase {

    var viewModel: CharactersViewModel!
       var mockApiService: NetworkMock!
       
       override func setUp() {
           super.setUp()
           
          
           mockApiService = NetworkMock()
           viewModel = CharactersViewModel(apiService: mockApiService)
       }
       
       override func tearDown() {
           viewModel = nil
           mockApiService = nil
           
           super.tearDown()
       }
       
       // MARK: - Tests
       
       func testViewIsLoaded() {
           
           let expectation = XCTestExpectation(description: "Fetch characters")
           
           
           viewModel.bindingData = { characters, error in
             
               XCTAssertNotNil(characters)
               XCTAssertNil(error)
               
               
               expectation.fulfill()
           }
           
      
           
           
           wait(for: [expectation], timeout: 5.0)
           
          
           XCTAssertEqual(mockApiService.fetchCharactersCallCount, 1)
       }
       
       func testCheckIfNeedToFetchNewPage() {
           
           let expectation = XCTestExpectation(description: "Fetch characters")
           
           
           viewModel.bindingData = { characters, error in
               
               XCTAssertNotNil(characters)
               XCTAssertNil(error)
               
               
               expectation.fulfill()
           }
           
           
           viewModel.checkIfNeedToFetchNewPage()
           
           wait(for: [expectation], timeout: 5.0)
           
           
           XCTAssertEqual(mockApiService.fetchCharactersCallCount, 1)
           
       }

}
