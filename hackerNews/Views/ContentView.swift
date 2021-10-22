//
//  ContentView.swift
//  hackerNews
//
//  Created by Phousanak Han on 05/08/20.
//  Copyright © 2020 Phousanak Han. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //@ObservedObject => listen to changes in var posts in NetworkManager
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        //Create navigation stack -> allow user to navigate from/to homepage
        NavigationView {
            //whenever content of networkManager.posts changes, we need to update what's shows on the screen
            
            //for every single post in networkManager.posts
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                      HStack{
                          //use each post to create new Text object
                          //the text view is populated using each post title and points property
                          Text(String(post.title))
                          Text(String(post.points))
                      }
                  }
            }
            .navigationBarTitle("HackerNews")
        }
        //
        .onAppear {
            //When body View appear on screen, perform the following
            self.networkManager.fetchData()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



