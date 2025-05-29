//
//  Network.swift
//  HackerNews
//
//  Created by Uday Abhishek on 27/05/25.
//


import Foundation

//class NetworkManager: ObservableObject {
//    @Published var posts = [Post]()
//    
//    func getData(retryCount: Int = 3) {
//        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
//            let urlSession = URLSession(configuration: .default)
//            let task = urlSession.dataTask(with: url) { [self] (data, response, error) in
//                if let error = error as? URLError, error.code == .networkConnectionLost, retryCount > 0 {
//                    // Retry the request
//                    getData(retryCount: retryCount - 1)
//                }
//                
//                 else if error == nil {
//                    let decoder = JSONDecoder()
//                    if let safeData = data {
//                        do {
//                            let result = try decoder.decode(Result.self, from: safeData)
//                            DispatchQueue.main.async {
//                                self.posts = result.hits
//                            }
//                            print(result)
//                        } catch {
//                            print("Failed to decode: \(error)")
//                        }
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//}
