//
//  HomeViewModel.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

class HomeViewModel: ObservableObject {
   private var network = NetworkDataSource.shared
   
   @Published var trending: Set<Trending.MediaItem> = []
   @Published var timeWindow: Trending.TimeWindow = .week
   
   func fetch() {
      network.fetchTrending(mediaType: .movie, timeWindow: timeWindow, completion: { self.handle($0) })
      network.fetchTrending(mediaType: .tv, timeWindow: timeWindow, completion: { self.handle($0) })
      network.fetchTrending(mediaType: .person, timeWindow: timeWindow, completion: { self.handle($0) })
   }
   
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
}
