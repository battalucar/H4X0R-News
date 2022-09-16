//
//  NewsManager.swift
//  H4X0R-News
//
//  Created by Battal Uçar on 11.09.2022.
//

import Foundation

class NewsManager: ObservableObject {
    let url = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    @Published var posts = [Post]()
    
    func fetchData(_ url: String) {
        if let url = URL(string: url) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results  = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }
                        catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
