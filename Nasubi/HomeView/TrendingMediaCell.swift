//
//  TrendingMediaCell.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/12.
//

import SwiftUI

struct TrendingMediaCell: View {
   @Binding var mediaItem: Trending.MediaItem
   
   var body: some View {
      VStack {
         //IMAGE
         AsyncImageView(imageEndPoint: .poster(path: mediaItem.posterPath!, size: .w185))
            .scaledToFill()
            .frame(width: 160, alignment: .top)
            .aspectRatio(0.669, contentMode: .fit)
            .cornerRadius(20)
         
         // TITLE
         HStack {
            Text(mediaItem.itemTitle)
               .font(.title3)
               .fontWeight(.semibold)
               .foregroundColor(Color(.label))
               .padding(.bottom, 1)
            Spacer()
         }
         
         // GENRE
         HStack {
            Genres(mediaItem.genreIds!)
               .font(.footnote)
               .foregroundColor(Color(.secondaryLabel))
               .lineLimit(2)
            Spacer()
         }
         Spacer()
      }
      .frame(width: 160, height: 340)
      
   }
   
   @ViewBuilder
   private func Genres(_ genres: [GenreId]) -> some View {
      let output = genres.map { $0.title.capitalized }.joined(separator: ", ")
      Text(output)
   }
}


struct MediaItemCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
         .preferredColorScheme(.dark)

    }
}
