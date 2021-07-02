//
//  PersonView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/24.
//

import SwiftUI

struct PersonView: View {
   @StateObject var viewModel: PersonViewModel
   @Environment(\.presentationMode) var presentationMode
   
   init(personId: PersonId) {
      self._viewModel = StateObject(wrappedValue: PersonViewModel(personId: personId))
   }
   
   var body: some View {
      Group {
         if viewModel.person != nil {
            ScrollView(.vertical) {
               ProfileView
                  .padding(.top, 16)
               Divider()
               DetailsView
               Divider()
               MoviesScrollView
               
            }
         } else {
            Text("Nothing here")
         }
      }
      .padding(.horizontal)
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden(true)
      .toolbar { toolbarItems }
      .onAppear { viewModel.fetch() }
   }
   
   var toolbarItems: some ToolbarContent {
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
   
   var ProfileView: some View {
      VStack {
         HStack(alignment: .top, spacing: 15) {
            AsyncImageView(imageEndPoint: .profile(path: viewModel.profilePath, size: .w185))
               .scaledToFit()
               .frame(maxWidth: 130, alignment: .top)
               .cornerRadius(15)
               .clipped()
            
            VStack(alignment: .leading) {
               Text(viewModel.name)
                  .font(.title2)
                  .fontWeight(.semibold)
               
               Text(viewModel.knownFor)
                  .font(.body)
                  .foregroundColor(Color(.systemGray))
                  .lineLimit(1)
                  .padding(.bottom, 4)

               NavigationLink(destination: Text(viewModel.biography)) {
                  Text(viewModel.biography)
                     .font(.system(size: 14))
                     .fontWeight(.light)
                     .foregroundColor(.primary)
                     .lineLimit(8)
               }
            }
         }
         Spacer()
      }
   }
   
   var DetailsView: some View {
      VStack(spacing: 10) {
         HStack {
            Text("Details")
               .font(.title)
               .fontWeight(.bold)
               .foregroundColor(Color(.label))
               .padding(.vertical, 8)
               .multilineTextAlignment(.center)
            Spacer()
         }
         
         TitleDetailView { Text("Date of Birth") } detail: { Text(viewModel.birthday) }
         if let deathDay = viewModel.deathDay {
            TitleDetailView { Text("Date of Death") } detail: { Text(deathDay) }
         }
         TitleDetailView { Text("Place of Birth") } detail: { Text(viewModel.placeOfBirth) }
      }
   }
   
   var MoviesScrollView: some View {
      Group {
         VStack(alignment: .leading) {
            Text("Movies")
               .font(.title)
               .fontWeight(.semibold)
            HorizontalScrollView {
               ForEach(viewModel.movies, id: \.self) { mediaItem in
                  MediaCell(mediaItem: Binding { mediaItem } set: { _ in })
               }
            }
         }
      }
   }
}

struct PersonsView_Previews: PreviewProvider {
      
   static var previews: some View {
      NavigationView {
         PersonView(personId: 287)
      }
      .preferredColorScheme(.dark)
   }
}
