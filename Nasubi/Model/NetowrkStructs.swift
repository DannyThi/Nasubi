//
//  NetworkStructs.swift
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



