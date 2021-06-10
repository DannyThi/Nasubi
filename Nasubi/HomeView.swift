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
         VStack {
            Section(header: Text("Trending Movies")) {
               Movies
            }
            Spacer()
         }
         .navigationBarTitle("Trending")
         .onAppear {
            viewModel.fetchTrendingData(mediaType: .movie, timeWindow: .week)
         }
      }
   }
   
   var Movies: some View {
      ScrollView(.horizontal) {
         Group {
            HStack(spacing: 10) {
               ForEach(viewModel.trending, id: \.id) { item in
                  MediaItemCell(mediaItem: Binding(get: { item }, set: { _ in } ))
               }
            }
         }.padding()
      }
   }
   
}

struct MediaItemCell: View {
   
   @Binding var mediaItem: TrendingMedia
   
   var body: some View {
      NavigationLink(destination: Text(mediaItem.itemTitle)) {
         VStack {
            
            //IMAGE
            Image("placeholder")
               .resizable()
               .frame(width: 160, height: 220)
               .cornerRadius(20)
            
            // TITLE
            HStack {
               Text(mediaItem.itemTitle)
                  .font(.title3)
                  .fontWeight(.semibold)
                  .foregroundColor(Color(UIColor.label))
                  .padding(.bottom, 1)
               Spacer()
            }
            
            // GENRE
            HStack {
               Genres(mediaItem.genreIds)
                  .font(.footnote)
                  .foregroundColor(Color(UIColor.secondaryLabel))
                  .lineLimit(2)
               Spacer()
            }
            Spacer()
         }
         .frame(width: 160, height: 300)
         .accentColor(Color(UIColor.label))
         .border(Color.black)
      }
   }
   
   @ViewBuilder
   private func Genres(_ genres: [Genre]) -> some View {
      let output = genres.map { $0.title.capitalized }.joined(separator: ", ")
      Text(output)
   }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(networkManager: NetworkManager()))
    }
}
