//
//  Genre.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/10.
//

import Foundation

enum Genre: Decodable, Hashable {
   case action, adventure, animation, comedy, crime, documentary, drama, family, fantasy, history,
        horror, music, mystery, romance, scifi, tvmovie, thriller, war, western
   
   case actionAdventure, kids, news, reality, scifiFantasy, soap, talk, warPolitics
   
   
   case unknown(value: Int)
   
   init(from decoder: Decoder) throws {
      do {
         let container = try decoder.singleValueContainer()
         let genreId = try container.decode(Int.self)
         
         switch genreId {
         // MOVIE
         case 28:    self = .action
         case 12:    self = .adventure
         case 16:    self = .animation
         case 35:    self = .comedy
         case 80:    self = .crime
         case 99:    self = .documentary
         case 18:    self = .drama
         case 10751: self = .family
         case 14:    self = .fantasy
         case 36:    self = .history
         case 27:    self = .horror
         case 10402: self = .music
         case 9648:  self = .mystery
         case 10749: self = .romance
         case 878:   self = .scifi
         case 10770: self = .tvmovie
         case 53:    self = .thriller
         case 10752: self = .war
         case 37:    self = .western
            
         // TV
         case 10759: self = .actionAdventure
         case 10762: self = .kids
         case 10763: self = .news
         case 10764: self = .reality
         case 10765: self = .scifiFantasy
         case 10766: self = .soap
         case 10767: self = .talk
         case 10768: self = .warPolitics
      
         default:
            self = .unknown(value: genreId)
         }
      }
   }
   
   var title: String {
      switch self {
      case .action:     return "action"
      case .adventure:  return "adventure"
      case .animation:  return "animation"
      case .comedy:     return "comedy"
      case .crime:      return "crime"
      case .documentary:return "documentary"
      case .drama:      return "drama"
      case .family:     return "family"
      case .fantasy:    return "fantasy"
      case .history:    return "history"
      case .horror:     return "horror"
      case .music:      return "music"
      case .mystery:    return "mystery"
      case .romance:    return "romance"
      case .scifi:      return "science fiction"
      case .tvmovie:    return "TV Movie"
      case .thriller:   return "thriller"
      case .war:        return "war"
      case .western:    return "western"
      case .actionAdventure:
                        return "action & adventure"
      case .kids:       return "kids"
      case .news:       return "news"
      case .reality:    return "reality"
      case .scifiFantasy:
                        return "sci-fi & fantasy"
      case .soap:       return "soap"
      case .talk:       return "talk"
      case .warPolitics:
                        return "war & politics"
  
      case .unknown(let genreId):
         return "Unknown Genre: \(genreId)"
      }
   }
}

/*
 {
    "genres":[
       {
          "id":10759,
          "name":"Action & Adventure"
       },
       {
          "id":16,
          "name":"Animation"
       },
       {
          "id":35,
          "name":"Comedy"
       },
       {
          "id":80,
          "name":"Crime"
       },
       {
          "id":99,
          "name":"Documentary"
       },
       {
          "id":18,
          "name":"Drama"
       },
       {
          "id":10751,
          "name":"Family"
       },
       {
          "id":10762,
          "name":"Kids"
       },
       {
          "id":9648,
          "name":"Mystery"
       },
       {
          "id":10763,
          "name":"News"
       },
       {
          "id":10764,
          "name":"Reality"
       },
       {
          "id":10765,
          "name":"Sci-Fi & Fantasy"
       },
       {
          "id":10766,
          "name":"Soap"
       },
       {
          "id":10767,
          "name":"Talk"
       },
       {
          "id":10768,
          "name":"War & Politics"
       },
       {
          "id":37,
          "name":"Western"
       }
    ]
 }*/
