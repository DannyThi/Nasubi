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
   
   private var networkManager: NetworkManager
   
   private(set) var id: MovieId {
      didSet {
         fetchMovie()
      }
   }
   
   init(id: MovieId, networkManager: NetworkManager) {
      self.id = id
      self.networkManager = networkManager
   }
   
   func fetchMovie() {
      networkManager.fetchMovie(byId: self.id) { result in
         DispatchQueue.main.async {
            switch result {
            case let .failure(error):
               print(NSBError.decodeError(error.localizedDescription))
            case let .success(movie):
               self.movie = movie
               print(movie)
            }
         }
      }
   }
}
