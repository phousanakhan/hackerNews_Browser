//
//  ContentView.swift
//  hackerNews
//
//  Created by Phousanak Han on 05/08/20.
//  Copyright © 2020 Phousanak Han. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                      HStack{
                          Text(String(post.title))
                          Text(String(post.points))
                      }
                  }
            }
            .navigationBarTitle("HackerNews")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



