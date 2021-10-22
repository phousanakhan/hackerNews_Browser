//
//  networkManager.swift
//  hackerNews
//
//  Created by Phousanak Han on 06/08/20.
//  Copyright © 2020 Phousanak Han. All rights reserved.
//

//From hn.aglgolia.com/api

//All stories that are on the front/home page right now
//http://hn.algolia.com/api/v1/search?tags=front_page

import Foundation

// NetworkManager must conform to protocol ObservableObject because we want to parse the result
//from the NetworkManager to the list inside the ContentView

//ObservableObject allow class to broadcast one or many of its property
class NetworkManager: ObservableObject {
    //@Published ==> if you're subscribe to this posts property, then you'll be able to hear from it whenever the content change
    @Published var posts = [Post]()
    
    func fetchData(){
        //if let => because URL string might not exist
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            
            //we get data in JSON format
            let task = session.dataTask(with: url) { (data, response, err) in
                if err == nil{
                    //use JSONDecoder() to decode the data we get back
                    let decoder = JSONDecoder()
                    //since data that we go back is optional, we need to bind it safeData
                    if let safeData = data{
                        do{
                            //decoder.decode can throw error
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                //hits is an array of post objects
                                self.posts = results.hits
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            //start the networking task
            task.resume()
        }
    }
}
