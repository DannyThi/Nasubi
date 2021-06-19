//
//  MovieView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/14.
//

import SwiftUI

struct MovieView: View {
   @StateObject private var viewModel: MovieViewModel
   @EnvironmentObject private var networkManager: NetworkManager
   @Environment(\.presentationMode) var presentationMode
   
   init(movieId: MovieId) {
      self._viewModel = StateObject(wrappedValue: .init(movieId: movieId))
   }
   
   var body: some View {
      Group {
         if viewModel.movie != nil {
            ZStack {
               BackdropImage
               MovieDetails
                  .padding()
            }
         } else {
            Text("Nothing here")
         }
      }
      .accentColor(.white)
      .navigationBarBackButtonHidden(true)
      .toolbar {
         ToolbarItem(placement: .navigationBarLeading) {
            Button {
               presentationMode.wrappedValue.dismiss()
            } label: {
               Image(systemName: "chevron.left")
                  .font(.system(size: 44, weight: .bold))
            }
            .accentColor(.white)
         }
      }
      .onAppear {
         networkManager.fetchMovie(byId: viewModel.movieId) { response in
            viewModel.handle(response)
         }
      }
   }
   
   private var MovieDetails: some View {
      ScrollView(.vertical) {
         TitleSection
         RatingsSection
      }
   }
}


// MARK - BACKDROP
extension MovieView {
   private var BackdropImage: some View {
      VStack {
         AsyncImageView(imageEndPoint: .backdrop(path: viewModel.backdropPath, size: .w300))
            .scaledToFit()
            .overlay(
               Color.clear
                  .background(
                     LinearGradient(gradient: .init(colors: [.clear, .black]),
                                    startPoint: .top,
                                    endPoint: .bottom)
                  )
            )
         Spacer()
      }
      .edgesIgnoringSafeArea(.top)
   }
}


//MARK: - TITLE
extension MovieView {
   private var TitleSection: some View {
      VStack {
         Text(viewModel.movieTitle)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color(.label))
            .padding(.vertical, 8)
            .multilineTextAlignment(.center)
         HStack {
            Text(viewModel.movieSubtitle)
               .font(.subheadline)
               .foregroundColor(Color(.secondaryLabel))
               .lineLimit(2)
               .multilineTextAlignment(.center)
         }
         Spacer()
      }
   }
}


//MARK: - RATINGS
extension MovieView {
   private var RatingsSection: some View {
      HStack(alignment: .center) {
         RatingsBuilder(ratings: viewModel.rating)
            .font(.system(size: 24))
         Text("\(viewModel.rating, specifier: "%.1f")")
            .foregroundColor(.yellow)
            .font(.system(size: 24))
            .fontWeight(.semibold)
      }
      .padding(.vertical)
   }
   
   @ViewBuilder
   private func RatingsBuilder(ratings: Float) -> some View {
      let stars = Int(ratings / 2)
      let remainder = 5 - Int(ratings / 2)
      HStack {
         ForEach(0..<stars) { _ in
            Image(systemName: "star.fill")
               .renderingMode(.original)
         }
         ForEach(0..<remainder) { _ in
            Image(systemName: "star.fill")
               .foregroundColor(Color(.systemGray))
         }
      }
   }
}



struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      NavigationView {
         MovieView(movieId: 615457)
            .environmentObject(NetworkManager())
            .preferredColorScheme(.dark)
      }
   }
}
