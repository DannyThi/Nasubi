//
//  AsyncImageView.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/10.
//

import SwiftUI
import Foundation

typealias URLStringPath = String

struct AsyncImageView: View {
   
   @StateObject private var imageLoader: ImageLoader
   var width: CGFloat { imageLoader.image?.size.width ?? 0.0 }
   var height: CGFloat { imageLoader.image?.size.height ?? 0.0 }
   
   var imagePath: String? {
      get { imageLoader.imagePath }
      set { imageLoader.imagePath = newValue }
   }
   
   init(imagePath: URLStringPath?) {
      self._imageLoader = StateObject(wrappedValue: ImageLoader(imagePath: imagePath))
   }
   
   init(imageEndPoint: ImageEndPoint) {
      let url = imageEndPoint.url.absoluteString
      self.init(imagePath: url)
   }
   
   var body: some View {
      image
         .onChange(of: imageLoader.imagePath) { imagePath in
            imageLoader.load()
         }
         .onAppear {
            imageLoader.load()
         }
   }
   
   var image: some View {
      ZStack {
         if let image = imageLoader.image {
            Image(uiImage: image)
               .resizable()
         } else {
            ProgressView()
         }
      }
   }
}

final class ImageLoader: ObservableObject {
   
   @Published var image: UIImage?
   var imagePath: URLStringPath?
   
   init(imagePath: URLStringPath?) {
      if let imagePath = imagePath {
         self.imagePath = imagePath
      }
   }
   
   func load() {
      guard let imagePath = imagePath,
            let url = URL(string: imagePath) else { return }
      
      URLSession.shared.dataTask(with: url) { data, _, error in
         DispatchQueue.main.async {
            guard let imageData = data else {
               print(error!.localizedDescription)
               return
            }
            
            self.image = UIImage(data: imageData)
         }
      }
      .resume()
   }
}
