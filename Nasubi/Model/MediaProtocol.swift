//
//  MediaProtocol.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/08.
//

import Foundation

protocol MediaProtocol: Decodable {
   var id: Int { get }
}

struct Genre: Identifiable, Decodable {
   var id: Int
   var name: String
}

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

enum MediaStatus: String, Decodable {
   case Rumored = "Rumored"
   case Planned = "Planned"
   case InProduction = "In Production"
   case PostProduction = "Post Production"
   case Released = "Released"
   case Canceled = "Canceled"
}
