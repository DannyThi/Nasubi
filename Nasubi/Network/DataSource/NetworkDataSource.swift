//
//  NetworkDataSource.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/25.
//

import Foundation

class NetworkDataSource: BaseNetwork, NetworkProtocol {
      
   static var shared = NetworkDataSource()
   
   var dataSource: NetworkProtocol?
   
   func fetchTrending(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow, completion: @escaping (Result<Trending.NetworkResponse, NSBError>) -> Void) {
      dataSource?.fetchTrending(mediaType: mediaType, timeWindow: timeWindow, completion: completion)
   }
   
   func fetchMedia<T>(_ type: MediaType, byId id: Int, completion: @escaping (Result<T, NSBError>) -> Void) where T : Decodable {
      dataSource?.fetchMedia(type, byId: id, completion: completion)
   }
}
