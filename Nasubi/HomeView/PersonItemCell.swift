//
//  PersonItemCell.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/16.
//

import SwiftUI

struct PersonItemCell: View {
   @Binding var person: Trending.MediaItem
   
   var body: some View {
      NavigationLink(destination: Text(person.itemTitle)) {
         if let profilePath = person.profilePath {
            VStack {
               AsyncImageView(imageEndPoint: .profile(path: profilePath, size: .w185))
                  .scaledToFill()
                  .frame(width: 100,height: 100, alignment: .center)
                  .clipShape(Circle())
                  .clipped()
               HStack {
                  VStack(alignment: .leading) {
                     Text(person.itemTitle)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.label))
                        .padding(.bottom, 1)
                     Text(person.knownForDepartment ?? "")
                        .font(.footnote)
                        .foregroundColor(Color(.secondaryLabel))
                        .lineLimit(2)
                  }
                  Spacer()
               }
               Spacer()
            }
            .frame(width: 120)
         }
      }
   }
}

struct PersonItemCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
         .environmentObject(NetworkManager())
         .preferredColorScheme(.dark)
    }
}
