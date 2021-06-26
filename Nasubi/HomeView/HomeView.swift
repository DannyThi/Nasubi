//
//  HomeView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import SwiftUI

struct HomeView: View {
   @ObservedObject private var viewModel: HomeViewModel
   
   init(viewModel: HomeViewModel) {
      self.viewModel = viewModel
   }
   
   var body: some View {
      NavigationView {
         ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center) {
               Movies
               Divider()
               TVShows
               Divider()
               Persons
               Spacer()
            }
            .navigationBarTitle("Trending")
         }
         .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
               Image(systemName: "magnifyingglass")
                  .imageScale(.large)
            }
         }
      }
      .accentColor(.white)

   }
   
   var Movies: some View {
      Group {
         Text("Movies")
            .font(.title2)
            .fontWeight(.semibold)
            .padding()
         HorizontalScrollView {
            ForEach(viewModel.trending.filter { $0.mediaType == .movie }, id: \.id) { item in
               NavigationLink(destination: MovieView(movieId: item.id)) {
                  TrendingMediaCell(mediaItem: Binding(get: { item }, set: { _ in } ))
               }
            }
         }
      }
   }
   
   var TVShows: some View {
      Group {
         Text("TV Shows")
            .font(.title2)
            .fontWeight(.semibold)
            .padding()
         HorizontalScrollView {
            ForEach(viewModel.trending.filter { $0.mediaType == .tv }, id: \.id) { item in
               #warning("Fix this")
               NavigationLink(destination: MovieView(movieId: item.id)) {
                  TrendingMediaCell(mediaItem: Binding(get: { item }, set: { _ in } ))
               }
            }
         }
      }
   }
   
   var Persons: some View {
      Group {
         Text("People")
            .font(.title2)
            .fontWeight(.semibold)
            .padding()
         HorizontalScrollView {
            ForEach(viewModel.trending.filter { $0.mediaType == .person }, id: \.id) { item in
               NavigationLink(destination: PersonView(personId: item.id)) {
                  TrendingPersonCell(person: Binding(get: { item }, set: { _ in } ))
               }
            }
         }
      }
   }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
         .preferredColorScheme(.dark)
    }
}
