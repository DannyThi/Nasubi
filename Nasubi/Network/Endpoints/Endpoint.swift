//
//  Endpoint.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

extension Endpoint {
   static func media(type: MediaType, withId id: Int) -> Self {
      switch type {
      case .movie:
         return movie(withId: id)
      case .tv:
         return tvShow(withId: id)
      case .person:
         return person(withId: id)
      }
   }
   
   static func movie(withId id: MovieId) -> Self {
      return Endpoint(path: "movie/\(id)")
   }
   
   static func tvShow(withId id: TVShowId) -> Self {
      return Endpoint(path: "tvshow/\(id)")
   }
   
   static func person(withId id: PersonId) -> Self {
      let queryItems = [URLQueryItem(name: "append_to_response", value: "movie_credits")]
      return Endpoint(path: "person/\(id)", queryItems: queryItems)
   }
   
   static func trendingMedia(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow) -> Self {
      Endpoint(path: "trending/\(mediaType.rawValue)/\(timeWindow.rawValue)")
   }
}

struct Endpoint {
   static var apikey: String {
      guard let file = Bundle.main.path(forResource: "apikey", ofType: "txt"),
            let key = try? String(contentsOfFile: file, encoding: .utf8) else {
         fatalError("Could not get api key")
      }
      return key.trimmingCharacters(in: .whitespacesAndNewlines)
   }
   private var path: String
   private var queryItems: [URLQueryItem]
   
   var url: URL {
      var components = URLComponents()
      components.scheme = "https"
      components.host = "api.themoviedb.org"
      components.path = "/3/" + path
      components.queryItems = queryItems
            
      guard let url = components.url else {
         preconditionFailure("Invalid URL components: \(components)")
      }
      
//      print(url)
      return url
   }
   
   init(path: String, queryItems: [URLQueryItem] = []) {
      self.path = path
      let key = URLQueryItem(name: "api_key", value: Self.apikey)
      var newQueryItems = [key]
      for item in queryItems {
         newQueryItems.append(item)
      }
      self.queryItems = newQueryItems
   }
   
   
}



