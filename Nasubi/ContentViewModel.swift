//
//  ContentViewModel.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

class ContentViewModel: ObservableObject {
   @Published var trending: [TrendingMedia] = []
   
   private let networkManager: NetworkManager
   
   init(networkManager: NetworkManager) {
      self.networkManager = networkManager
   }
   
   
   func fetchTrendingData() {
      networkManager.fetchTrending(mediaType: .all, timeWindow: .week) { result in
         switch result {
         case let .failure(error):
            print(error.description)
         case let .success(trendingData):
            self.trending = trendingData
         }
      }
   }
   
}
