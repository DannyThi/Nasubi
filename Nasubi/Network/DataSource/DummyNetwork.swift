//
//  DummyNetwork.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/25.
//

import UIKit

class DummyNetwork: BaseNetwork, NetworkProtocol {
   
   func fetchTrending(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow, completion: @escaping (Result<Trending.NetworkResponse, NSBError>) -> Void) {
      var path: String
      
      switch mediaType {
      case .movie:
         path = "Model/DummyData/trending_movie_json"
      case .tv:
         path = "Model/DummyData/trending_tv_json"
      case .person:
         path = "Model/DummyData/trending_person_json"
      default:
         completion(.failure(.default("Incompatible media type.")))
         return
      }
      
      if let url = Bundle.main.url(forResource: path, withExtension: "txt") {
         do {
            let data = try Data(contentsOf: url)
            let trendingData = try parse(jsonData: data, to: Trending.NetworkResponse.self)
            completion(.success(trendingData))
         }
         catch let error {
            print("error")
            completion(.failure(.decodeError(error.localizedDescription)))
         }
      }
      
   }
   
   func fetchMedia<T>(_ type: MediaType, byId id: Int, completion: @escaping (Result<T, NSBError>) -> Void) where T : Decodable {
      var path: String
      
      switch type {
      case .movie:
         path = "Model/DummyData/movie_json"
      case .person:
         path = "Model/DummyData/person_json"
      case .tv:
         path = "Model/DummyData/tvshow_json"
      }
      
   
      if let url = Bundle.main.url(forResource: path, withExtension: "txt") {
         do {
            let data = try Data(contentsOf: url)
            let item = try parse(jsonData: data, to: T.self)
            completion(.success(item))
         }
         catch {
            completion(.failure(.decodeError(error.localizedDescription)))
         }
      }
   }
   
   func fetchImage(imagePath: String?, completion: @escaping (Data) -> Void) {
      
   }
}
