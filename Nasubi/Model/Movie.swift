//
//  MovieDetails.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

struct Movie: MediaProtocol, Decodable {
   var adult: Bool
   var backdropPath: String?
   var belongsToCollection: Bool? // this might error
   var budget: Int
   var genres: [Genre]
   var homepage: String?
   var id: Int
   var imdbId: String?
   var originalLanguage: String
   var originalTitle: String
   var overview: String?
   var popularity: Float
   var posterPath: String?
   var productionCompanies: [ProductionCompany]
   var productionCountries: [ProductionCountries]
   var releaseDate: String
   var revenue: Int
   var runtime: Int?
   var spokenLanguages: [SpokenLanguage]
   var status: MediaStatus
   var tagline: String?
   var title: String
   var video: Bool
   var voteAverage: Float
   var voteCount: Int
}
   

