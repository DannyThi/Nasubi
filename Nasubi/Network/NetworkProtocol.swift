//
//  NetworkProtocol.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/21.
//

import Foundation

protocol Networking {
   func fetchTrending(mediaType: Trending.MediaType,
                      timeWindow: Trending.TimeWindow,
                      completion: @escaping (Result<Trending.NetworkResponse,NSBError>) -> Void)
   
   func fetchMovie(byId id: MovieId,
                   completion: @escaping (Result<Movie,NSBError>) -> Void)

   func fetchPerson(byId id: PersonId,
                    completion: @escaping (Result<Person,NSBError>) -> Void)

}

// HACK SO WE CAN SWAP OUT DUMMY NETWORKS FOR OUR NETWORK ENVIRONMENT OBJECT IN OUR VIEWS.
// THIS CLASS WILL BE INHERITED BY OTHER NETWORK SUBCLASSES.
class NetworkProtocol: Networking, ObservableObject {
   func fetchTrending(mediaType: Trending.MediaType,
                      timeWindow: Trending.TimeWindow,
                      completion: @escaping (Result<Trending.NetworkResponse, NSBError>) -> Void) { }
   
   func fetchMovie(byId id: MovieId, completion: @escaping (Result<Movie, NSBError>) -> Void) { }
   
   func fetchPerson(byId id: PersonId,
                    completion: @escaping (Result<Person,NSBError>) -> Void) { }
}

