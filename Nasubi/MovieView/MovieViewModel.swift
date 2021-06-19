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


// MARK: - TITLE SECTION
extension MovieViewModel {
   var movieTitle: String {
      self.movie?.itemTitle ?? ""
   }
   
   var movieSubtitle: String {
      "\(self.year) • \(self.genres) • \(self.runtime)"
   }
   
   private var genres: String {
      let genreString = movie?.genres?.map { $0.name.capitalized }.joined(separator: ", ")
      return genreString ?? ""
   }
   
   private var year: String {
      let yearString = movie?.releaseDate?.prefix(4)
      return String(yearString ?? "")
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
      return ""
   }
}


// MARK: - RATINGS
extension MovieViewModel {
   var rating: Float {
      self.movie?.voteAverage ?? 0.0
   }
}
