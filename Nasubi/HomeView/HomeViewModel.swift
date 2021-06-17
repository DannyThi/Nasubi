//
//  HomeViewModel.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

class HomeViewModel: ObservableObject {
   @Published var trending: Set<Trending.MediaItem> = []
   @Published var timeWindow: Trending.TimeWindow = .week

   func handle(_ response: Result<Trending.NetworkResponse, NSBError>) {
      DispatchQueue.main.async {
         switch response {
         case let .failure(error):
            print(error.localizedDescription)
         case let .success(response):
            let results = response.results
            self.trending.insert(results)
         }
      }
   }
   
   
//   init() {
//      self.updateData()
//   }
   
//   func fetchTrendingData(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow) {
//      networkManager?.fetchTrending(mediaType: mediaType, timeWindow: timeWindow) { networkResponse in
//         DispatchQueue.main.async {
//            switch networkResponse {
//            case let .failure(error):
//               print(error.localizedDescription)
//            case let .success(response):
//               let results = response.results
//               self.trending.insert(results)
//            }
//         }
//      }
//   }
   
//   func toggleTimeWindow() {
//      self.timeWindow = timeWindow == .week ? .day : .week
//   }
   
//   private func refreshData() {
//      self.trending = []
//      self.updateData()
//   }
//
//   private func updateData() {
//      self.fetchTrendingData(mediaType: .movie, timeWindow: timeWindow)
//      self.fetchTrendingData(mediaType: .tv, timeWindow: timeWindow)
//      self.fetchTrendingData(mediaType: .person, timeWindow: .day)
//   }
}


