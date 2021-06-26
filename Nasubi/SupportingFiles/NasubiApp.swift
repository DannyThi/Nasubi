//
//  NasubiApp.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import SwiftUI

@main
struct NasubiApp: App {
   
   @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
   private let contentViewModel = HomeViewModel()
   
   var body: some Scene {
      WindowGroup {
         HomeView(viewModel: contentViewModel)
            .environment(\.colorScheme, .dark)
            .preferredColorScheme(.dark)
      }
   }
}

class AppDelegate: NSObject, UIApplicationDelegate {
   func application(_ application: UIApplication,
                    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {      
      NetworkDataSource.shared.dataSource = Networking()
      
      return true
   }
}
