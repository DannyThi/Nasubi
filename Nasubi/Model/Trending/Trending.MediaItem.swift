//
//  Trending.MediaItem.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/14.
//

import Foundation

extension Trending {

   struct MediaItem: Decodable, Hashable {
      
      private var title: String?
      private var originalTitle: String?
      private var name: String?
      private var originalName: String?
      
      var id: Int
      var mediaType: Trending.MediaType
      
      var itemTitle: String { title ?? name ?? "No name or title." }
      var originalItemTitle: String { originalTitle ?? originalName ?? "No original name or title." }
      
      var overview: String?
      var originalLanguage: String?
      
      var genreIds: [GenreId]?

      var popularity: Double?
      var voteCount: Int?
      var voteAverage: Double?
      
      var posterPath: String?
      var backdropPath: String?
      
      // MOVIE
      var releaseDate: String?
      var video: Bool?
      var adult: Bool?
      
      // TV
      var firstAirDate: String?
      var originCountry: [String]?

      // PERSON
      var gender: Int?
      var knownFor: [MediaItem]?
      var knownForDepartment: String?
      var profilePath: String?
   }
}
