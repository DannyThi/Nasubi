//
//  MediaItemCell.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/12.
//

import SwiftUI

struct MediaItemCell: View {
   @Binding var mediaItem: TrendingMovie
   
   var body: some View {
      NavigationLink(destination: Text(mediaItem.itemTitle)) {
         VStack {
            //IMAGE
            AsyncImageView(imageEndPoint: .poster(path: mediaItem.posterPath!, size: .w300))
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
//         .accentColor(Color(UIColor.label))
      }
   }
   
   @ViewBuilder
   private func Genres(_ genres: [Genre]) -> some View {
      let output = genres.map { $0.title.capitalized }.joined(separator: ", ")
      Text(output)
   }
}
