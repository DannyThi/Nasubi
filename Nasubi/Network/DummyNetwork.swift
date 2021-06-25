//
//  DummyNetwork.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/25.
//

import Foundation

class DummyNetwork: NetworkProtocol {
   
   func fetchTrending(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow, completion: @escaping (Result<Trending.NetworkResponse, NSBError>) -> Void) {
      
   }
   
   func fetchMedia<T>(_ type: MediaType, byId id: Int, completion: @escaping (Result<T, NSBError>) -> Void) where T : Decodable {
      
   }
}
