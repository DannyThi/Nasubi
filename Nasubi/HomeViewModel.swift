//
//  HomeViewModel.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

class HomeViewModel: ObservableObject {
   @Published var trendingMovies: [Trending.MediaItem] = []
   @Published var trendingTvShows: [Trending.MediaItem] = []
   @Published var trendingPersons: [Trending.MediaItem] = []
   
   @Published var trending: Set<Trending.MediaItem> = []
   
   private let networkManager: NetworkManager
   
   init(networkManager: NetworkManager) {
      self.networkManager = networkManager
      self.fetchTrendingData(mediaType: .movie, timeWindow: .week)
      self.fetchTrendingData(mediaType: .tv, timeWindow: .week)
      self.fetchTrendingData(mediaType: .person, timeWindow: .week)
   }
   
   func fetchTrendingData(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow) {
      networkManager.fetchTrending(mediaType: mediaType, timeWindow: timeWindow) { networkResponse in
         DispatchQueue.main.async {
            switch networkResponse {
            case let .failure(error):
               print(NSBError.decodeError(error))
            case let .success(response):
               let results = response.results
               self.trending.insert(results)
            }
         }
      }
   }
}


