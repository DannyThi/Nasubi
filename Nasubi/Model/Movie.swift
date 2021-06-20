//
//  MovieDetails.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

struct Movie: Decodable {
   
   private var title: String
   private var originalTitle: String

   var id: Int

   var itemTitle: String { title }
   var originalItemTitle: String { originalTitle }
   
   // DETAILS
   var overview: String?
   var tagline: String?
   var originalLanguage: String?
   var spokenLanguages: [SpokenLanguage]?
   var runtime: Int?

   // SECONDARY DETAILS
   var genres: [Genre]?
   var releaseDate: String?
   var video: Bool?
   var adult: Bool?
//   var belongsToCollection: Bool? // this might error

   // PRODUCTION
   var productionCompanies: [ProductionCompany]?
   var productionCountries: [ProductionCountries]?
   var status: MediaStatus?
   var budget: Int?
   var revenue: Int?

   // RATINGS
   var popularity: Double
   var voteCount: Int
   var voteAverage: Double
   
   // LINKS
   var imdbId: String?
   var homepage: String?
   var posterPath: String?
   var backdropPath: String?
}

extension Movie {
   struct ProductionCompany: Identifiable, Decodable {
      var name: String
      var id: Int
      var logoPath: String?
      var originCountry: String
   }
   
   struct ProductionCountries: Decodable {
      var iso31661 : String
      var name: String
   }
   
   struct SpokenLanguage: Decodable {
      var englishName: String?
      var iso6391: String
      var name: String
   }
   
   enum MediaStatus: Decodable {
      case rumored, planned, inProduction, postProduction, released, canceled
      case unknown(String)
      
      var title: String {
         switch self {
         case .rumored:          return "rumored"
         case .planned:          return "planned"
         case .inProduction:     return "in production"
         case .postProduction:   return "post production"
         case .released:         return "released"
         case .canceled:         return "cancelled"
         case .unknown(let status):
                                 return "unknown: \(status)"
         }
      }
      
      init(from decoder: Decoder) throws {
         do {
            let container = try decoder.singleValueContainer()
            let status = try container.decode(String.self)
            
            switch status {
            case "rumored":         self = .rumored
            case "planned":         self = .planned
            case "in_production":   self = .inProduction
            case "post_production": self = .postProduction
            case "released":        self = .released
            case "canceled":        self = .canceled
            default:
               self = .unknown(status)
            }
         }
      }
   }
}
