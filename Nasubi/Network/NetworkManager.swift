//
//  NetworkManager.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

typealias MovieID = Int
typealias TVShowID = Int

struct TrendingJSONData: Decodable {
   let totalResults: Int?
   let totalPages: Int?
   let page: Int?
   let results: [TrendingMedia]?
}

class NetworkManager {
   
   func fetchTrending(mediaType: MediaType,
                      timeWindow: TimeWindow,
                      completion: @escaping (Result<TrendingJSONData,NSBError>) -> Void) {
      
      URLSession.shared.request(.trendingMedia(mediaType: mediaType,
                                               timeWindow: timeWindow)) { data, response, error in
         guard let jsonData = data else {
            completion(.failure(.fetchError(error!)))
            return
         }

         do {
            let trendingData = try self.decode(jsonData: jsonData, to: TrendingJSONData.self)
            completion(.success(trendingData))
         }
         catch let error {
            completion(.failure(.decodeError(error)))
         }
      }
   }
   
   func fetchMovie(id: MovieID, completion: @escaping (Result<Movie,NSBError>) -> Void) {
      URLSession.shared.request(.movie(withId: id)) { data, response, error in
         guard let data = data else {
            completion(.failure(.fetchError(error!)))
            return
         }
         do {
            let movie = try self.decode(jsonData: data, to: Movie.self)
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

enum MediaType: String {
   case all, movie, tvshow, person
}

enum TimeWindow: String {
   case day, week
}
