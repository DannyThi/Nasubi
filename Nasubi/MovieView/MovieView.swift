//
//  MovieView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/14.
//

import SwiftUI

struct MovieView: View {
   @StateObject private var viewModel: MovieViewModel
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
         viewModel.fetch()
      }
   }
   
   private var MovieDetails: some View {
      ScrollView(.vertical) {
         VStack {
            TitleSection
            RatingsSection
            OverviewSection
            MetaDataSection
            Spacer()
         }
      }
   }
}


// MARK - BACKDROP
extension MovieView {
   private var BackdropImage: some View {
      VStack {
         AsyncImageView(imageEndPoint: .backdrop(path: viewModel.backdropPath, size: .w780))
            .scaledToFill()
            .frame(maxHeight: 200, alignment: .top)
            .clipped()
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
   private func RatingsBuilder(ratings: Double) -> some View {
      let percent = ratings * 10
      let stars = (percent + 0.5) / 20
      let rounded = Int(stars.rounded())
      let remainder = Int(5 - rounded)
      
      HStack {
         ForEach(0..<rounded) { _ in
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


//MARK: - OVERVIEW
extension MovieView {
   private var OverviewSection: some View {
      VStack(alignment: .leading) {
         Text("Overview")
            .font(.title2)
            .fontWeight(.semibold)
            .padding(.bottom, 4)
         Text(viewModel.overview)
            .lineSpacing(5.0)
      }
      .padding(.vertical)
   }
}


// MARK: - CAST
//extension MovieView {
//   private var CastSection: some View {
//      ScrollView(.horizontal) {
//         HStack {
//            ForEach(viewModel.)
//         }
//      }
//   }
//}


// MARK: - META DATA
extension MovieView {
   private var MetaDataSection: some View {
      VStack {
         HStack {
            Text("Meta Data")
               .font(.title2)
               .fontWeight(.semibold)
               .padding(.bottom, 4)
            Spacer()
         }
         
         VStack(spacing: 10) {
            TitleDetailView { Text("Status:")} detail: { Text(viewModel.status) }
            TitleDetailView { Text("Release Date")} detail: { Text(viewModel.releaseDate) }
            TitleDetailView { Text("Spoken Languages:") } detail: { Text(viewModel.spokenLanguages) }
            TitleDetailView { Text("Revenue:") } detail: { Text(viewModel.revenue) }
            TitleDetailView { Text("Budget:") } detail: { Text(viewModel.budget) }
         }
      }
      .padding(.vertical)
   }

}


struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      NavigationView {
         MovieView(movieId: 615457)
            .preferredColorScheme(.dark)
      }
      
   }
}
