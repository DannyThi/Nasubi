//
//  SetExtension.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/14.
//

import Foundation

extension Set {
   @discardableResult mutating func insert(_ newMembers: [Set.Element]) -> [(inserted: Bool, memberAfterInsert: Set.Element)] {
       var returnArray: [(inserted: Bool, memberAfterInsert: Set.Element)] = []
       newMembers.forEach { (member) in
           returnArray.append(self.insert(member))
       }
       return returnArray
   }
}
