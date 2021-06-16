//
//  HomeViewModel.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

class HomeViewModel: ObservableObject {
   @Published var trending: Set<Trending.MediaItem> = []
   
   private let networkManager: NetworkManager
   private var timeWindow: Trending.TimeWindow = .week {
      didSet {
         self.updateData()
      }
   }

   init(networkManager: NetworkManager) {
      self.networkManager = networkManager
      self.updateData()
   }
   
   func fetchTrendingData(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow) {
      networkManager.fetchTrending(mediaType: mediaType, timeWindow: timeWindow) { networkResponse in
         DispatchQueue.main.async {
            switch networkResponse {
            case let .failure(error):
               
               print(error.localizedDescription)
            case let .success(response):
               let results = response.results
               self.trending.insert(results)
            }
         }
      }
   }
   
   func toggleTimeWindow() {
      self.timeWindow = timeWindow == .week ? .day : .week
   }
   
   private func refreshData() {
      self.trending = []
      self.updateData()
   }
   
   private func updateData() {
      self.fetchTrendingData(mediaType: .movie, timeWindow: timeWindow)
      self.fetchTrendingData(mediaType: .tv, timeWindow: timeWindow)
      self.fetchTrendingData(mediaType: .person, timeWindow: .day)
   }
}


