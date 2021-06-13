//
//  NetworkManager.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

typealias MovieID = Int
typealias TVShowID = Int


class NetworkManager {
   
   func fetchTrending(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow,
                      completion: @escaping (Result<Trending.NetworkResposnse,NSBError>) -> Void) {
      URLSession.shared.request(.trendingMedia(mediaType: mediaType, timeWindow: timeWindow)) { data, response, error in
         guard let jsonData = data else {
            completion(.failure(.fetchError(error!)))
            return
         }
         do {
            let trendingData = try self.decode(jsonData: jsonData, to: Trending.NetworkResposnse.self)
            completion(.success(trendingData))
         }
         catch let error {
            completion(.failure(.decodeError(error)))
         }
      }
   }
   
   func fetchMovie(byId id: MovieID, completion: @escaping (Result<Movie_,NSBError>) -> Void) {
      URLSession.shared.request(.movie(withId: id)) { data, response, error in
         guard let data = data else {
            completion(.failure(.fetchError(error!)))
            return
         }
         do {
            let movie = try self.decode(jsonData: data, to: Movie_.self)
            completion(.success(movie))
         } catch let error {
            completion(.failure(.decodeError(error)))
         }
      }
   }
   
   private typealias JSONData = Data
   private func decode<T>(jsonData data: JSONData, to type: T.Type) throws -> T where T: Decodable {
      do {
         let decoder = JSONDecoder()
         decoder.keyDecodingStrategy = .convertFromSnakeCase
         
         let output = try decoder.decode(T.self, from: data)
         return output
      }
      catch let error {
         throw NSBError.decodeError(error)
      }
   }
}
