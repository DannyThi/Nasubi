//
//  TextView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/26.
//

import SwiftUI

struct TextView: UIViewRepresentable {
   var text: String
   
   func makeUIView(context: Context) -> UITextView {
      let textView = UITextView()
      textView.showsVerticalScrollIndicator = false
      textView.showsHorizontalScrollIndicator = false
      textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
      textView.textAlignment = .justified
      textView.allowsEditingTextAttributes = false
      return textView
   }
   
   func updateUIView(_ uiView: UITextView, context: Context) {
      uiView.text = text
   }
}
