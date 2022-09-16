//
//  ContentView.swift
//  H4X0R-News
//
//  Created by Battal Uçar on 11.09.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var newsManager = NewsManager()
    let url = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    var body: some View {
        NavigationView {
            List(newsManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle(Text("H4X0R News"))
            .listStyle(.plain)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            self.newsManager.fetchData(url)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
