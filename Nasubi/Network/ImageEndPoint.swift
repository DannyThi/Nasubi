//
//  ImageEndPoint.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/12.
//

import Foundation

extension ImageEndPoint {
   static func backdrop(path: String, size: BackdropSize) -> Self {
      ImageEndPoint(imagePath: path, size: size.rawValue)
   }
   static func poster(path: String, size: ProfileSize) -> Self {
      ImageEndPoint(imagePath: path, size: size.rawValue)
   }
   
   static func profile(path: String, size: ProfileSize) -> Self {
      ImageEndPoint(imagePath: path, size: size.rawValue)
   }
}

struct ImageEndPoint {
   var imagePath: String
   var size: String

   var url: URL {
      var components = URLComponents()
      components.scheme = "https"
      components.host = "image.tmdb.org"
      components.path = "/t/p/" + size + "/" + imagePath
      
      guard let url = components.url else {
         preconditionFailure("Invalid URL components: \(components)")
      }
      return url
   }
   
   enum BackdropSize: String {
      case w300, w780, w1280, original
   }
   
   enum LogoSize: String {
      case w45, w92, w154, w185, w300, w500, original
   }
   
   enum PosterSize: String {
      case w92, w154, w185, w342, w500, w780, original
   }
   
   enum ProfileSize: String {
      case w45, w185, h632, original
   }
   
   enum StillSize: String {
      case w92, w185, w300, original
   }
}
