//
//  Endpoint.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

extension Endpoint {
   static func movie(withId id: MovieID) -> Self {
      Endpoint(path: "movies/\(id)")
   }
   
   static func tvShow(withId id: TVShowID) -> Self {
      Endpoint(path: "tvshows/\(id)")
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
   private var queryItems: [URLQueryItem] = []
   
   var url: URL {
      var components = URLComponents()
      components.scheme = "https"
      components.host = "api.themoviedb.org"
      components.path = "/3/" + path
      components.queryItems = queryItems
      components.queryItems!.append(URLQueryItem(name: "api_key", value: Self.apikey))
            
      guard let url = components.url else {
         preconditionFailure("Invalid URL components: \(components)")
      }
      
      print(url)
      return url
   }
}


