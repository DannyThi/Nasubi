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
}
