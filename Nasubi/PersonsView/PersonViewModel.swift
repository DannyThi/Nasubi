//
//  PersonViewModel.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/24.
//

import Foundation

class PersonViewModel: ObservableObject {
   @Published var person: Person?
   @Published var errorMessage: String?
   
   private(set) var personId: Int
   
   init(personId: PersonId) {
      self.personId = personId
   }
   
   func handle(response: Result<Person,NSBError>, completion: ((Person) -> Void)? = nil ) {
      DispatchQueue.main.async {
         switch response {
         case let .failure(error):
            print(error)
         case let .success(person):
            self.person = person
            completion?(person)
            print("Handled response successfully")
         }
      }
   }
}

extension PersonViewModel {
   var profilePath: String {
      return person?.profilePath ?? ""
   }
}
