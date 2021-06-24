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
      let queryItem = URLQueryItem(name: "language", value: "en-US")
      return Endpoint(path: "movie/\(id)", queryItems: [queryItem])
   }
   static func person(withId id: PersonId) -> Self {
      let queryItem = URLQueryItem(name: "language", value: "en-US")
      return Endpoint(path: "person/\(id)", queryItems: [queryItem])
   }
   
   static func tvShow(withId id: TVShowId) -> Self {
      let queryItem = URLQueryItem(name: "language", value: "en-US")
      return Endpoint(path: "tvshow/\(id)", queryItems: [queryItem])
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


