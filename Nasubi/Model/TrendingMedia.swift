//
//  TrendingMedia.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/08.
//

import Foundation

struct TrendingMedia: MediaProtocol, Decodable {
   var posterPath: String?
   var adult: Bool?
   var overview: String?
   var releaseDate: String?
   var genreIds: [Int]?
   var id: Int
   var originalTitle: String?
   var originalLanguage: String?
   var title: String?
   var backdropPath: String?
   var popularity: Float?
   var voteCount: Int?
   var video: Bool?
   var voteAverage: Float?
   var mediaType: String?
}
