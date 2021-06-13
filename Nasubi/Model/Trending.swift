//
//  Trending.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/08.
//

import Foundation

struct Trending {
   struct NetworkResposnse: Decodable {
      let totalResults: Int?
      let totalPages: Int?
      let page: Int?
      let results: [TrendingMovie]?
   }
}

extension Trending {
   enum MediaType: Decodable, Hashable {
      case all, movie, tv, person
      case unknown(type: String)
      
      init(from decoder: Decoder) throws {
         do {
            let container = try decoder.singleValueContainer()
            let type = try container.decode(String.self)
            
            switch type {
            case "movie":  self = .movie
            case "tv":     self = .tv
            case "person": self = .person
            default:
               self = .unknown(type: type)
            }
         }
      }
      
      var rawValue: String {
         switch self {
         case .all:     return "all"
         case .movie:   return "movie"
         case .tv:      return "tv"
         case .person:  return "person"
         case .unknown(let type):
            return "Unknown type: \(type)"
         }
      }
   }

   enum TimeWindow: String {
      case day, week
   }
}


