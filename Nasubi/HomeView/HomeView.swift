//
//  HomeView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import SwiftUI

struct HomeView: View {
   
   @ObservedObject var viewModel: HomeViewModel
      
   init(viewModel: HomeViewModel) {
      self.viewModel = viewModel
   }
   
   var body: some View {
      NavigationView {
         ScrollView(.vertical) {
            VStack(alignment: .center) {
               Movies
               Divider()
               TVShows
               Spacer()
            }
            .navigationBarTitle("Trending")
            .onAppear {
               
            }
         }
      }
   }
   
   var Movies: some View {
      Group {
         Text("Movies")
            .font(.title2)
            .fontWeight(.semibold)
            .padding()
         HorizontalScrollView {
            ForEach(viewModel.trending.filter { $0.mediaType == .movie }, id: \.id) { item in
               MediaItemCell(mediaItem: Binding(get: { item }, set: { _ in } ))
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
               MediaItemCell(mediaItem: Binding(get: { item }, set: { _ in } ))
            }
         }
      }
   }

   @ViewBuilder
   private func scrollViewBuilder(for content: AnyView) -> some View {
      ScrollView(.horizontal) {
         HStack(spacing: 10) {
            content
         }
         .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
      }
   }
   
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(networkManager: NetworkManager()))
    }
}
