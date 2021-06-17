//
//  MovieView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/14.
//

import SwiftUI

struct MovieView: View {
      
   @StateObject private var viewModel: MovieViewModel
   
   init() {
      self._viewModel = StateObject(wrappedValue: .init())
   }
   
   var body: some View {
      movieView()

   }
   
   @ViewBuilder private func movieView() -> some View {
      if let movie = viewModel.movie {
         Text(movie.itemTitle)
      } else {
         ProgressView()
      }
   }
   
   
   @ViewBuilder
   private func errorView() -> some View {
      Group {
         if let _ = viewModel.errorMessage {
            Text("something went wrong")
         }
      }
   }
   
}


struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      MovieView()
   }
}
