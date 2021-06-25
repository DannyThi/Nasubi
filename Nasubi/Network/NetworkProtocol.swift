//
//  NetworkProtocol.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/25.
//

import Foundation

protocol NetworkProtocol {
   func fetchTrending(mediaType: Trending.MediaType, timeWindow: Trending.TimeWindow,
                      completion: @escaping (Result<Trending.NetworkResponse,NSBError>) -> Void)
   func fetchMedia<T:Decodable>(_ type: MediaType, byId id: Int, completion: @escaping (Result<T, NSBError>) -> Void)
}

