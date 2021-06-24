//
//  TitleDetailView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/21.
//

import SwiftUI

struct TitleDetailView<Title:View,Detail:View>: View {
   
   var title: Title
   var detail: Detail
   
   init(title: @escaping () -> Title, detail: @escaping () -> Detail) {
      self.title = title()
      self.detail = detail()
   }
   var body: some View {
      HStack(alignment: .top) {
         title
            .font(.body.bold())
         Spacer(minLength: 4)
         detail
      }
   }
}

