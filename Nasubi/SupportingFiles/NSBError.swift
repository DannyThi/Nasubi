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
   case `default`(String)

}



