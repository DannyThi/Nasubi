//
//  Person.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/24.
//

import Foundation

struct Person: Decodable {
   
   let id: Int
   let name: String
   let gender: Gender?
   let knownForDepartment: String

   let biography: String?

   let birthday: String?
   let deathDay: String?
   let placeOfBirth: String?

   let alsoKnownAs: [String]?
   let adult: Bool?
   let imdbId: String
   let homepage: String?
   let popularity: Double
   
   let profilePath: String?
   
   let movieCredits: MovieCredits?
}

enum Gender: Decodable {
   case female, male
   case other
   
   init(from decoder: Decoder) throws {
      do {
         let container = try decoder.singleValueContainer()
         let value = try container.decode(Int.self)
         
         switch value {
         case 1: self = .female
         case 2: self = .male
         default:
            self = .other
         }
      }
   }
   
   var title: String {
      switch self {
      case .female:
         return "female"
      case .male:
         return "male"
      default:
         return "other"
      }
   }
}
