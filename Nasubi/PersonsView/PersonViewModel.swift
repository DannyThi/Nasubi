//
//  PersonViewModel.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/24.
//

import Foundation

class PersonViewModel: ObservableObject {
   private var network = NetworkDataSource.shared

   @Published var person: Person?
   @Published var errorMessage: String?
   
   private(set) var personId: Int

   init(personId: PersonId) {
      self.personId = personId
   }
   
   init(dummyData person: Person) {
      self.personId = person.id
      self.person = person
      fetch()
   }
   
   func fetch() {
      network.fetchMedia(.person, byId: personId, completion: { self.handle(response: $0)})
   }
   
   func handle(response: Result<Person,NSBError>, completion: ((Person) -> Void)? = nil ) {
      DispatchQueue.main.async {
         switch response {
         case let .failure(error):
            print(error)
         case let .success(person):
            self.person = person
            completion?(person)
//            print("Handled response successfully")
         }
      }
   }
}

extension PersonViewModel {
   var profilePath: String {
      return person?.profilePath ?? ""
   }
   
   var name: String {
      return person?.name ?? "-"
   }
   
   var gender: String {
      return person?.gender?.title ?? "-"
   }
   
   var knownFor: String {
      person?.knownForDepartment ?? "-"
   }
   
   var biography: String {
      person?.biography ?? "-"
   }
   
   var birthday: String {
      return person?.birthday != nil ? date(from: person!.birthday!) : "-"
   }
   
   var deathDay: String? {
      return person?.deathDay != nil ? date(from: person!.deathDay!) : nil
   }
   
   var placeOfBirth: String {
      person?.placeOfBirth ?? "-"
   }
   
   var isAdult: Bool {
      return person?.adult != nil ? person!.adult! : false
   }
   
   private func date(from dateString: String) -> String {
      let formatter = DateFormatter()
      formatter.dateFormat = "YYYY-MM-DD"
      let date = formatter.date(from: dateString)!
      formatter.dateStyle = .long
      return formatter.string(from: date)
   }
}



//let alsoKnownAs: [String]?
//let imdbId: String
//let homepage: String?
//let popularity: Double
