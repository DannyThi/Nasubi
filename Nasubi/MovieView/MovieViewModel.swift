//
//  MovieViewModel.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/14.
//

import Foundation

class MovieViewModel: ObservableObject {
   
   @Published var movie: Movie?
   @Published var errorMessage: String?

   private(set) var movieId: MovieId
   
   init(movieId: MovieId) {
      self.movieId = movieId
   }

   func handle(_ response: Result<Movie, NSBError>, completion: ((Movie) -> Void)? = nil) {
      DispatchQueue.main.async {
         switch response {
         case let .failure(error):
            print(error)
         case let .success(movie):
            self.movie = movie
            completion?(movie)
            print("Handled response successfully")
         }
      }
   }
}


// MARK: - BACKDROP
extension MovieViewModel {
   var backdropPath: String {
      self.movie?.backdropPath ?? ""
   }
}


// MARK: - TITLE
extension MovieViewModel {
   var movieTitle: String {
      self.movie?.itemTitle ?? "-"
   }
   
   var tagline: String {
      self.movie?.tagline ?? "-"
   }
   var movieSubtitle: String {
      "\(self.year) • \(self.genres) • \(self.runtime)"
   }
   
   private var genres: String {
      let genreString = movie?.genres?.map { $0.name.capitalized }.joined(separator: ", ")
      return genreString ?? "-"
   }
   
   private var year: String {
      let yearString = movie?.releaseDate?.prefix(4)
      return String(yearString ?? "-")
   }
   
   private var runtime: String {
      if let rawRuntime = movie?.runtime {
         let time = TimeInterval(rawRuntime * 60)
         let formatter = DateComponentsFormatter()
         formatter.allowedUnits = [.hour,.minute]
         formatter.unitsStyle = .abbreviated
         formatter.zeroFormattingBehavior = .pad
         return formatter.string(from: time)!
      }
      return "-"
   }
}


// MARK: - RATINGS
extension MovieViewModel {
   var rating: Double {
      self.movie?.voteAverage ?? 0.0
   }
}


// MARK: - OVERVIEW
extension MovieViewModel {
   var overview: String {
      self.movie?.overview ?? "-"
   }
}


// MARK: - CAST
//extension MovieViewModel {
//   var cast: String {
//      return movie.
//   }
//}

// MARK: - MOVIE DETAILS
extension MovieViewModel {
   
   var spokenLanguages: String {
      let languages = movie?.spokenLanguages?.compactMap { $0.englishName?.capitalized }
      return languages?.joined(separator: ", ") ?? "-"
   }
   
   var releaseDate: String {
      return movie?.releaseDate ?? "-"
   }
   
   var status: String {
      return movie?.status?.title.capitalized ?? "-"
   }

   var budget: String {
      guard let budget = movie?.budget else {
         return "-"
      }
      if budget == 0 {
         return "-"
      }
      let formatter = NumberFormatter()
      formatter.numberStyle = .currency
      formatter.currencySymbol = "$"
      formatter.maximumFractionDigits = 0
      let formatted = formatter.string(from: NSNumber(value: budget))
      return formatted ?? "-"
   }
   
   var revenue: String {
      guard let revenue = movie?.revenue else {
         return "-"
      }
      if revenue == 0 {
         return "-"
      }
      
      let formatter = NumberFormatter()
      formatter.numberStyle = .currency
      formatter.currencySymbol = "$"
      formatter.maximumFractionDigits = 0
      let formatted = formatter.string(from: NSNumber(value: revenue))
      return formatted ?? "-"
   }
}
