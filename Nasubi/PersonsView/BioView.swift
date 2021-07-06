//
//  BioView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/07/06.
//

import SwiftUI

struct BioView: View {
   
   var text: String?
   
   var body: some View {
      Group {
         TextView(text: text ?? "")
      }
      .padding(.horizontal)
   }
}

struct BioView_Previews: PreviewProvider {
      
   static var previews: some View {
      NavigationView {
         BioView(text: text)
      }
      .preferredColorScheme(.dark)
   }
   
   static let text =
   """
   Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
   """
}


