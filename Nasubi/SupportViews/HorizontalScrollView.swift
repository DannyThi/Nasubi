//
//  HorizontalScrollView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/12.
//

import SwiftUI

struct HorizontalScrollView<Content: View>: View {
   let content: () -> Content
   
   var body: some View {
      ScrollView(.horizontal) {
         HStack(spacing: 20) {
            content()
         }
         .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
      }
   }
}
