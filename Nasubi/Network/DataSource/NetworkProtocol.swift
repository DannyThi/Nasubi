//
//  NetworkProtocol.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/25.
//

import Foundation

protocol NetworkProtocol: BaseNetwork {
   func fetchTrending(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow,
                      completion: @escaping (Result<Trending.NetworkResponse,NSBError>) -> Void)
   func fetchMedia<T:Decodable>(_ type: MediaType, byId id: Int, completion: @escaping (Result<T, NSBError>) -> Void)
   
   func fetchImage(imagePath: String?, completion: @escaping (Data) -> Void)
}

class BaseNetwork: ObservableObject {
   typealias JSONData = Data
   
   func parse<T>(jsonData data: JSONData, to type: T.Type) throws -> T where T: Decodable {
      do {
         let decoder = JSONDecoder()
         decoder.keyDecodingStrategy = .convertFromSnakeCase
         let output = try decoder.decode(T.self, from: data)
         return output
      }
      catch let error {
         throw NSBError.decodeError(error.localizedDescription)
      }
   }
}
