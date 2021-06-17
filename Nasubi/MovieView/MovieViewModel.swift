//
//  MovieViewModel.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/14.
//

import Foundation

class MovieViewModel: ObservableObject {
   
   @Published var movie: Movie?
   @Published var errorMessage: String?

   

}
