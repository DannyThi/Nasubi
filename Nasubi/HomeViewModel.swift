//
//  HomeViewModel.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

class HomeViewModel: ObservableObject {
   @Published var trending: [TrendingMedia] = []
   
   private let networkManager: NetworkManager
   
   init(networkManager: NetworkManager) {
      self.networkManager = networkManager
   }
   
   func fetchTrendingData(mediaType: MediaType, timeWindow: TimeWindow) {
      networkManager.fetchTrending(mediaType: mediaType, timeWindow: timeWindow) { result in
         DispatchQueue.main.async {
            switch result {
            case let .failure(error):
               print(error.description)
            case let .success(trendingJSONData):
               if let trendingResults = trendingJSONData.results {
                  self.trending = trendingResults
               }
            }
         }
      }
   }
   

   
}
