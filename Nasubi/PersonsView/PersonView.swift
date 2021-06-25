//
//  PersonView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/24.
//

import SwiftUI

struct PersonView: View {
   @StateObject var viewModel: PersonViewModel
   @EnvironmentObject var networkManager: NetworkDataSource
   @Environment(\.presentationMode) var presentationMode
   
   init(personId: PersonId) {
      self._viewModel = StateObject(wrappedValue: PersonViewModel(personId: personId))
   }
   
   var body: some View {
      Group {
         if let person = viewModel.person {
            ScrollView(.vertical) {
               VStack {
                  HStack(alignment: .top, spacing: 15) {
                     AsyncImageView(imageEndPoint: .profile(path: viewModel.profilePath, size: .w185))
                        .scaledToFit()
                        .frame(maxWidth: 160, alignment: .top)
                        .cornerRadius(15)
                        .clipped()
                     
                     VStack {
                        Text(person.name)
                           .font(.title2)
                           .fontWeight(.semibold)
                     }
                     
                     Spacer()
                  }
                  
                  Spacer()
               }
            }
         } else {
            Text("No Person")
         }
      }
      .padding(.horizontal)
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
         networkManager.fetchMedia(.person, byId: viewModel.personId) { response in
            viewModel.handle(response: response)
         }
      }
   }
}

struct PersonsView_Previews: PreviewProvider {
   static var previews: some View {
      NavigationView {
         PersonView(personId: 287)
            .environmentObject(NetworkDataSource(dataSource: DummyNetwork()))
      }
      .preferredColorScheme(.dark)
   }
}