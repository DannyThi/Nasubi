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
   }
   
   private func testDummyFetchTrending() {
      let dummy = DummyNetwork()
      dummy.fetchTrending(mediaType: .movie, timeWindow: .week) { response in
         switch response {
         case .failure(let error):
            XCTFail("Expected to be a success but got a failure with \(error)")
         case .success(let trending):
            XCTAssertNotNil(trending.results, "Not nil")
         }
      }
   }
   
   private func testDummyFetchMedia() {
      let dummy = DummyNetwork()

      dummy.fetchMedia(.movie, byId: 581726) { (response:Result<Movie,NSBError>) in
         switch response {
         case .failure(let error):
            XCTFail("Expected to be a success but got a failure with \(error)")
         case .success(let movie):
            XCTAssertNotNil(movie, "Not nil")
         }
      }
   }
   
   private func testFetchImage() {
      let dummy = DummyNetwork()
   }
}
