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
   
   @Published var trending: [Trending.MediaItem] = []
   
   private let networkManager: NetworkManager
   
   init(networkManager: NetworkManager) {
      self.networkManager = networkManager
   }
   
   func fetchTrendingData(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow) {
      networkManager.fetchTrending(mediaType: mediaType, timeWindow: timeWindow) { networkResponse in
         DispatchQueue.main.async {
            switch networkResponse {
            case let .failure(error):
               print(NSBError.decodeError(error))
            case let .success(response):
               let results = response.results
               self.trending = results
            }
         }
      }
   }
   

   
}


//            switch networkResponse {
//            case let .failure(error):
//               print(error.description)
//            case let .success(networkResponse):
//               let data = networkResponse.results
////               if let networkResponseData = networkResponseData.results {
//                  switch mediaType {
//                  case .movie:
//                     self.trendingMovies = data as! [Trending.Movie]
//                  case .tv:
//                     self.trendingTvShows = data as! [Trending.TVShow]
//                  case .person:
//                     self.trendingPersons = data as! [Trending.Person]
//                  default:
//                     // Not handling this case.
//                     break
//                  }
////               }
//            }
