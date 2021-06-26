//
//  Person.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/24.
//

import Foundation

struct Person: Decodable {
   
   let id: Int
   let name: String
   let gender: Gender?
   let knownForDepartment: String

   let biography: String?

   let birthday: String?
   let deathDay: String?
   let placeOfBirth: String?

   let alsoKnownAs: [String]?
   let adult: Bool?
   let imdbId: String
   let homepage: String?
   let popularity: Double
   
   let profilePath: String?
   
   
   static let example: Person = .init(id: 287,
                                      name: "Brad Pitt",
                                      gender: .male,
                                      knownForDepartment: "Acting",
                                      biography: """
                                       William Bradley \"Brad\" Pitt (born December 18, 1963) is an American actor and film producer.
                                       Pitt has received two Academy Award nominations and four Golden Globe Award nominations,
                                       winning one. He has been described as one of the world's most attractive men, a label for
                                       which he has received substantial media attention. Pitt began his acting career with
                                       television guest appearances, including a role on the CBS prime-time soap opera Dallas
                                       in 1987. He later gained recognition as the cowboy hitchhiker who seduces Geena Davis's
                                       character in the 1991 road movie Thelma & Louise. Pitt's first leading roles in big-budget
                                       productions came with A River Runs Through It (1992) and Interview with the Vampire (1994).
                                       He was cast opposite Anthony Hopkins in the 1994 drama Legends of the Fall, which earned him
                                       his first Golden Globe nomination. In 1995 he gave critically acclaimed performances in the crime
                                       thriller Seven and the science fiction film 12 Monkeys, the latter securing him a Golden Globe Award
                                       for Best Supporting Actor and an Academy Award nomination.\n\nFour years later, in 1999, Pitt starred
                                       in the cult hit Fight Club. He then starred in the major international hit as Rusty Ryan in Ocean's
                                       Eleven (2001) and its sequels, Ocean's Twelve (2004) and Ocean's Thirteen (2007). His greatest commercial
                                       successes have been Troy (2004) and Mr. & Mrs. Smith (2005).\n\nPitt received his second Academy Award
                                       nomination for his title role performance in the 2008 film The Curious Case of Benjamin Button. Following a
                                       high-profile relationship with actress Gwyneth Paltrow, Pitt was married to actress Jennifer Aniston for
                                       five years. Pitt lives with actress Angelina Jolie in a relationship that has generated wide publicity. He
                                       and Jolie have six children—Maddox, Pax, Zahara, Shiloh, Knox, and Vivienne.\n\nSince beginning his relationship
                                       with Jolie, he has become increasingly involved in social issues both in the United States and internationally.
                                       Pitt owns a production company named Plan B Entertainment, whose productions include the 2007 Academy Award
                                       winning Best Picture, The Departed.
                                       """,
                                      birthday: "1963-12-18",
                                      deathDay: nil,
                                      placeOfBirth: "Shawnee, Oklahoma, USA",
                                      alsoKnownAs: ["Бред Питт", "Бред Пітт", "Buratto Pitto",
                                                    "Брэд Питт", "畢·彼特", "ブラッド・ピット", "브래드 피트", "แบรด พิตต์"],
                                      adult: false,
                                      imdbId: "nm0000093",
                                      homepage: nil,
                                      popularity: 10.647,
                                      profilePath: "/kU3B75TyRiCgE270EyZnHjfivoq.jpg")
}

enum Gender: Decodable {
   case female, male
   case other
   
   init(from decoder: Decoder) throws {
      do {
         let container = try decoder.singleValueContainer()
         let value = try container.decode(Int.self)
         
         switch value {
         case 1: self = .female
         case 2: self = .male
         default:
            self = .other
         }
      }
   }
   
   var title: String {
      switch self {
      case .female:
         return "female"
      case .male:
         return "male"
      default:
         return "other"
      }
   }
}
