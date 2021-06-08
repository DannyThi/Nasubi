//
//  URLSessionExtention.swift
//  Nasubi
//
//  Created by Hai Long Danny Thi on 2021/06/07.
//

import Foundation

extension URLSession {
   typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
   
   @discardableResult
   func request(_ endpoint: Endpoint, completion handler: @escaping CompletionHandler) -> URLSessionDataTask {
      print(endpoint.url)
      let task = self.dataTask(with: endpoint.url, completionHandler: handler)
      task.resume()
      return task
   }
}
