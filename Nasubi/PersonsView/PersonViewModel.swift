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
   var profilePath: String { person?.profilePath ?? "" }
   var name: String { person?.name ?? "-" }
   
   var knownFor: String {
      if let person = person, person.knownForDepartment == "Acting" {
         return person.gender == .female ? "Actress" : "Actor"
      }
      return person?.knownForDepartment ?? "-"
   }
   
   var biography: String { person?.biography ?? "-" }
   var placeOfBirth: String { person?.placeOfBirth ?? "-" }
   var birthday: String { person?.birthday != nil ? date(from: person!.birthday!) : "-" }
   var deathDay: String? { person?.deathDay != nil ? date(from: person!.deathDay!) : nil }
   
   private func date(from dateString: String) -> String {
      let formatter = DateFormatter()
      formatter.dateFormat = "YYYY-MM-DD"
      let date = formatter.date(from: dateString)!
      formatter.dateStyle = .long
      return formatter.string(from: date)
   }
   
   var isAdult: Bool { person?.adult != nil ? person!.adult! : false }
   var alsoKnownAs: [String] { person?.alsoKnownAs != nil ? person!.alsoKnownAs! : ["-"] }
   var imdbId: String { person?.imdbId ?? "-" }
   var homePage: String { person?.homepage ?? "" }
   
   
   var movies: [MediaCellItem] {
      if let cast = person?.movieCredits?.cast {
         return cast.map { MediaCellItem(posterPath: $0.posterPath ?? "", title: $0.title, subtitle: $0.character!)}
      }
      return []
   }
   

}
