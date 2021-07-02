//
//  MovieCredits.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/29.
//

import Foundation

struct MovieCredits: Decodable {
   let cast: [Cast]?
//   let crew: [Crew]
   
   struct Cast: Decodable, Hashable {
      let id: Int
      let title: String
      let genreIds: [GenreId]?
      let posterPath: String?
      let character: String?
   }
   
   struct Crew: Decodable, Hashable {
      let id: Int
      let title: String
      let department: String?
      let job: String?
   }
}


