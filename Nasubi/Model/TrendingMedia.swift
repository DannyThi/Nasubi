//
//  TrendingMedia.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/08.
//

import Foundation

struct TrendingMedia: Decodable {
   private var title: String?
   private var originalTitle: String?
   private var name: String?
   private var originalName: String?
   
   var id: Int
   var mediaType: String
   
   var itemTitle: String { title ?? name ?? "No name or title." }
   var originalItemTitle: String { originalTitle ?? originalName ?? "No original name or title." }
   
   var overview: String
   var originalLanguage: String
   
   var genreIds: [Genre]
   var releaseDate: String
   var video: Bool?
   var adult: Bool

   var popularity: Float
   var voteCount: Int
   var voteAverage: Float

   var posterPath: String?
   var backdropPath: String?
}
