//
//  Networking.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

typealias MovieId = Int
typealias TVShowId = Int
typealias PersonId = Int

class Networking: ObservableObject, NetworkProtocol {
   
   func fetchTrending(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow,
                      completion: @escaping (Result<Trending.NetworkResponse,NSBError>) -> Void) {
//      print("Fetching Trending: \(mediaType.rawValue.capitalized) for the \(timeWindow.rawValue).")
      URLSession.shared.request(.trendingMedia(mediaType: mediaType, timeWindow: timeWindow)) { data, response, error in
         guard let jsonData = data else {
            completion(.failure(.fetchError(error!.localizedDescription)))
            return
         }
         do {
            let networkResponse = try self.parse(jsonData: jsonData, to: Trending.NetworkResponse.self)
//            print("Recieved trending \(mediaType.rawValue.capitalized) for the \(timeWindow.rawValue.capitalized)")
            completion(.success(networkResponse))
         }
         catch let error {
            completion(.failure(.decodeError(error.localizedDescription)))
         }
      }
   }
   
   func fetchMedia<T:Decodable>(_ type: MediaType, byId id: Int, completion: @escaping (Result<T, NSBError>) -> Void) {
      URLSession.shared.request(.media(type: type, withId: id)) { data, response, error in
         guard let data = data else {
            completion(.failure(.fetchError(error!.localizedDescription)))
            return
         }
         do {
            let item = try self.parse(jsonData: data, to: T.self)
            completion(.success(item))
         }
         catch let error {
            completion(.failure(.decodeError(error.localizedDescription)))
         }
      }
   }

   private typealias JSONData = Data
   private func parse<T>(jsonData data: JSONData, to type: T.Type) throws -> T where T: Decodable {
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


