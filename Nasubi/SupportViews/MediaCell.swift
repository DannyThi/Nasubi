//
//  MediaCell.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/29.
//

import SwiftUI

protocol MediaCellItemProtocol {
   var posterPath: String { get }
   var title: String { get }
   var subtitle: String { get }
}

struct MediaCellItem: MediaCellItemProtocol, Hashable {
   var posterPath: String
   var title: String
   var subtitle: String
}

struct MediaCell: View {
   @Binding var mediaItem: MediaCellItemProtocol
   
   var body: some View {
      VStack {
         // IMAGE
         
         AsyncImageView(imageEndPoint: .poster(path: mediaItem.posterPath, size: .w185))
            .scaledToFill()
            .frame(width: 160, alignment: .top)
            .aspectRatio(0.669, contentMode: .fit)
            .cornerRadius(20)
         
         // TITLE
         HStack {
            Text(mediaItem.title)
               .font(.title3)
               .fontWeight(.semibold)
               .foregroundColor(Color(.label))
               .padding(.bottom, 1)
            Spacer()
         }
         
         // SUBTITLE
         HStack {
            Text(mediaItem.subtitle)
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

/*
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
 */
