//
//  NasubiApp.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import SwiftUI

@main
struct NasubiApp: App {
   
   private let contentViewModel = HomeViewModel(networkManager: NetworkManager())
   
   var body: some Scene {
      WindowGroup {
         HomeView(viewModel: contentViewModel)
      }
   }
}
