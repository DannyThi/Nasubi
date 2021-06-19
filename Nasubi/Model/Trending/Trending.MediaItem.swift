//
//  Trending.MediaItem.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/14.
//

import Foundation

extension Trending {

   struct MediaItem: Decodable, Hashable {
      
      private var title: String?
      private var originalTitle: String?
      private var name: String?
      private var originalName: String?
      
      var id: Int
      var mediaType: Trending.MediaType
      
      var itemTitle: String { title ?? name ?? "No name or title." }
      var originalItemTitle: String { originalTitle ?? originalName ?? "No original name or title." }
      
      var overview: String?
      var originalLanguage: String?
      
      var genreIds: [GenreId]?

      var popularity: Float?
      var voteCount: Int?
      var voteAverage: Float?
      
      var posterPath: String?
      var backdropPath: String?
      
      // MOVIE
      var releaseDate: String?
      var video: Bool?
      var adult: Bool?
      
      // TV
      var firstAirDate: String?
      var originCountry: [String]?

      // PERSON
      var gender: Int?
      var knownFor: [MediaItem]?
      var knownForDepartment: String?
      var profilePath: String?
   }

//               {
//                  "adult":false,
//                  "gender":2,
//                  "name":"Ding Chengxin",
//                  "id":2864043,
//                  "known_for":[
//                     {
//                        "backdrop_path":"/6W23cZ85GOUZe9oGvpyyvrAxB6y.jpg",
//                        "first_air_date":"2018-07-23",
//                        "genre_ids":[
//                           35,
//                           10759
//                        ],
//                        "id":81105,
//                        "name":"Sweet Combat",
//                        "origin_country":[
//                           "CN"
//                        ],
//                        "original_language":"zh",
//                        "original_name":"甜蜜暴击",
//                        "overview":"As the eldest daughter of the Fang Conglomerate, Fang Yu was raised to become the sole successor of the company, yet she goes against her family's objections to pursue boxing and won the championship title at the young age of 18. On the other hand, Ming Tian comes from a poor family. He once stopped schooling for three years in order to work and he decided to apply for a sports scholarship despite not having any background whatsoever. Fang Yu was one of the first to see his talents and their relationship grows over time.",
//                        "poster_path":"/d2B9KYATTdd6YfzLUfuwAtTHbsL.jpg",
//                        "vote_average":7.9,
//                        "vote_count":8,
//                        "popularity":4.427,
//                        "media_type":"tv"
//                     },
//                     {
//                        "original_language":"zh",
//                        "original_title":"畫皮: 郭敬明版",
//                        "poster_path":"/r1ggFs2j79Y0kiq2eApp3DMZxim.jpg",
//                        "video":false,
//                        "vote_average":10.0,
//                        "overview":"Guo Jingming's short film for «Everybody Stand By» contest. Based on Pu Songling's Painted Skin and the film directed by Gordon Chan",
//                        "id":766748,
//                        "vote_count":1,
//                        "title":"Painted Skin: The Guo Jingming Edition",
//                        "adult":false,
//                        "backdrop_path":null,
//                        "release_date":"2020-11-14",
//                        "genre_ids":[
//
//                        ],
//                        "popularity":3.141,
//                        "media_type":"movie"
//                     },
//                     {
//                        "backdrop_path":"/5Zg0ayeJVqq4sOIB9SB87ytO00D.jpg",
//                        "first_air_date":"2017-07-09",
//                        "genre_ids":[
//                           18
//                        ],
//                        "id":119538,
//                        "name":"Boy Hood",
//                        "origin_country":[
//                           "CN"
//                        ],
//                        "original_language":"zh",
//                        "original_name":"我们的少年时代",
//                        "overview":"",
//                        "poster_path":"/2s0PHsIr0UxSeEw8ycrwaMDY3ob.jpg",
//                        "vote_average":0.0,
//                        "vote_count":0,
//                        "popularity":1.033,
//                        "media_type":"tv"
//                     }
//                  ],
//                  "known_for_department":"Acting",
//                  "profile_path":"/qW3RN1KiuD2yh2tUJp172FKURpH.jpg",
//                  "popularity":0.6,
//                  "media_type":"person"
//               },


}
