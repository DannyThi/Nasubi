//
//  NSBError.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

enum NSBError: Error {
   case fetchError(String)
   case decodeError(String)
   
//   var description: String {
//      switch self {
//      case .fetchError(let error):
//         return "Error fetching data: \(error.localizedDescription)"
//      case .decodeError(let error):
//         return "Error decoding data: \(error.localizedDescription)"
//      }
//   }
}



