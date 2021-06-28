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
   
   init(person: Person) {
      self._viewModel = StateObject(wrappedValue: PersonViewModel(dummyData: person))
   }
   
   var body: some View {
      Group {
         if viewModel.person != nil {
            ScrollView(.vertical) {
               ProfileView
                  .padding(.top, 16)
               Divider()
               DetailsView
               
            }
         } else {
            Text("No Person")
         }
      }
      .padding(.horizontal)
      .navigationBarTitleDisplayMode(.inline)
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
               
               Text(viewModel.placeOfBirth)
                  .font(.caption2)
                  .foregroundColor(Color(.systemGray))
                  .lineLimit(1)
                  .padding(.bottom, 4)

               NavigationLink(destination: Text(viewModel.biography)) {
                  Text(viewModel.biography)
                     .foregroundColor(.primary)
                     .lineLimit(7)
               }
            }
         }
         Spacer()
      }
   }
   
   var DetailsView: some View {
      VStack {
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
         if viewModel.deathDay != nil {
            TitleDetailView { Text("Death of Death") } detail: { Text(viewModel.deathDay) }
         }

      }
   }
}

struct PersonsView_Previews: PreviewProvider {
   
   static let example = Person.example
   
   static var previews: some View {
      NavigationView {
         PersonView(person: example)
      }
      .preferredColorScheme(.dark)
   }
}
