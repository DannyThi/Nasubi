//
//  NasubiTests.swift
//  NasubiTests
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import XCTest
@testable import Nasubi

class NasubiTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   private func testNetworkManagerAPIKeyImport() {
      
      XCTAssert(Endpoint.apikey != "", "API key must not be nil")
      
//      let endpoint = Endpoint.movie(withId: 10)
      
      
      
//      let networkManager = NetworkManager()
//      XCTAssertNotNil(networkManager.apiKey, "API key must not be nil")
//      XCTAssert(networkManager.apiKey != "", "API key must have a value.")
      
      
   }
}
