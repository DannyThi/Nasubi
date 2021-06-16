//
//  MediaItemCell.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/12.
//

import SwiftUI

struct MediaItemCell<Destination:View>: View {
   @Binding var mediaItem: Trending.MediaItem
   var navigationLink: Destination
   
   var body: some View {
      NavigationLink(destination: navigationLink) {
         VStack {
            //IMAGE
            AsyncImageView(imageEndPoint: .poster(path: mediaItem.posterPath!, size: .w185))
               .scaledToFill()
               .frame(width: 160, alignment: .top)
               .aspectRatio(0.669, contentMode: .fit)
               .cornerRadius(20)
//               .border(Color.black)

            
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
               Genres(mediaItem.genreIds!)
                  .font(.footnote)
                  .foregroundColor(Color(UIColor.secondaryLabel))
                  .lineLimit(2)
               Spacer()
            }
            Spacer()
         }
         .frame(width: 160, height: 340)
      }
   }
   
   @ViewBuilder
   private func Genres(_ genres: [Genre]) -> some View {
      let output = genres.map { $0.title.capitalized }.joined(separator: ", ")
      Text(output)
   }
}


struct MediaItemCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(networkManager: NetworkManager()))
    }
}
