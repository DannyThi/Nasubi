//
//  ContentView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import SwiftUI

struct ContentView: View {
   
   @ObservedObject var viewModel: ContentViewModel
   
   init(viewModel: ContentViewModel) {
      self.viewModel = viewModel
   }
   
   var body: some View {
      VStack {
         ForEach(viewModel.trending, id: \.id) { data in
            Text(data.title)
         }
      }.onAppear {
         viewModel.fetchTrendingData()
      }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(networkManager: NetworkManager()))
    }
}
