//
//  HomeViewModel.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

class HomeViewModel: ObservableObject {
   @Published var trendingMovies: [Trending.Movie] = []
   @Published var trendingTvShows: [Trending.Movie] = []
   @Published var trendingPersons: [Trending.Movie] = []
   
   private let networkManager: NetworkManager
   
   init(networkManager: NetworkManager) {
      self.networkManager = networkManager
   }
   
   func fetchTrendingData(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow) {
      networkManager.fetchTrending(mediaType: mediaType, timeWindow: timeWindow) { result in
         DispatchQueue.main.async {
            switch result {
            case let .failure(error):
               print(error.description)
            case let .success(trendingJSONData):
               if let trendingResults = trendingJSONData.results {
                  switch mediaType {
                  case .movie:
                     self.trendingMovies = trendingResults
                  case .tv:
                     print("TV Shows: \(trendingResults)")
                     self.trendingTvShows = trendingResults
                  case .person:
                     print("Persons: \(trendingResults)")
                     self.trendingPersons = trendingResults
                  default:
                     // Not handling this case.
                     break
                  }
               }
            }
         }
      }
   }
   

   
}
