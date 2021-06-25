//
//  HomeView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import SwiftUI

// THERE IS A SWIFTUI BUG IN WHICH ONAPPEAR IS CALLED TWICE

struct HomeView: View {
   @ObservedObject private var viewModel: HomeViewModel
   @EnvironmentObject private var networkManager: NetworkDataSource
   
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
      }.accentColor(.white)
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
      }.onAppear {
         networkManager.fetchTrending(mediaType: .movie, timeWindow: viewModel.timeWindow) {
            networkResponse in
            viewModel.handle(networkResponse)
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
      }.onAppear {
         networkManager.fetchTrending(mediaType: .tv, timeWindow: viewModel.timeWindow) {
            networkResponse in
            viewModel.handle(networkResponse)
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
      }.onAppear {
         networkManager.fetchTrending(mediaType: .person, timeWindow: viewModel.timeWindow) {
            networkResponse in
            viewModel.handle(networkResponse)
         }
      }
   }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
         .environmentObject(NetworkDataSource(dataSource: DummyNetwork()))
         .preferredColorScheme(.dark)
    }
}
