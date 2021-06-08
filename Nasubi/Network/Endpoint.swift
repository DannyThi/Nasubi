//
//  Endpoint.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

extension Endpoint {
   static func movie(withId id: MovieID) -> Self {
      Endpoint(path: "movies/\(id)?\(Self.apikey)")
   }
   
   static func tvShow(withId id: TVShowID) -> Self {
      Endpoint(path: "tvshows/\(id)?\(Self.apikey)")
   }
   
   static func trendingMedia(mediaType: MediaType, timeWindow: TimeWindow) -> Self {
      Endpoint(path: "trending/\(mediaType.rawValue)/\(timeWindow.rawValue)?\(Self.apikey)")
   }
}

struct Endpoint {
   static var apikey: String {
      guard let file = Bundle.main.path(forResource: "apikey", ofType: "txt"),
            let key = try? String(contentsOfFile: file, encoding: .utf8) else {
         fatalError("Could not get api key")
      }
      return "api_key=" + key
   }
   
   var path: String
   var queryItems: [URLQueryItem] = []
   
   var url: URL {
      var components = URLComponents()
      components.scheme = "https"
      components.host = "api.themoviedb.org/3/"
      components.path = "/" + path
      components.queryItems = queryItems
      
      guard let url = components.url else {
         preconditionFailure("Invalid URL components: \(components)")
      }
      return url
   }
}


