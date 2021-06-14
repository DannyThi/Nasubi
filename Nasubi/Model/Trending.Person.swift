//
//  Trending.Person.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/14.
//

import Foundation

extension Trending {
   
   @available(*, deprecated, message: "Use MediaItem instead")
   struct Person: AnyMediaItem, Decodable {
      var id: Int
      
      var mediaType: Trending.MediaType
      
      
   }
}
