//
//  NetworkManager.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

typealias MovieId = Int
typealias TVShowId = Int

class NetworkManager: NetworkProtocol {
   
   override func fetchTrending(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow,
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
   
   override func fetchMovie(byId id: MovieId, completion: @escaping (Result<Movie,NSBError>) -> Void) {
//      print("Fetching movie. ID: \(id)")
      URLSession.shared.request(.movie(withId: id)) { data, response, error in
         guard let data = data else {
            completion(.failure(.fetchError(error!.localizedDescription)))
            return
         }
         do {
            let movie = try self.parse(jsonData: data, to: Movie.self)
            completion(.success(movie))
         }
         catch let error {
            completion(.failure(.decodeError(error.localizedDescription)))
         }
      }
   }
   
   override func fetchPerson(byId id: PersonId, completion: @escaping (Result<Person,NSBError>) -> Void) {
//      print("Fetching person. ID: \(id)")
      URLSession.shared.request(.person(withId: id)) { data, response, error in
         guard let data = data else {
            completion(.failure(.fetchError(error!.localizedDescription)))
            return
         }
         do {
            let movie = try self.parse(jsonData: data, to: Person.self)
            completion(.success(movie))
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


