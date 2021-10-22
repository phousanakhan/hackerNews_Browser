//
//  PostData.swift
//  hackerNews
//
//  Created by Phousanak Han on 06/08/20.
//  Copyright © 2020 Phousanak Han. All rights reserved.
//

import Foundation

//Result struct only have single property
struct Results: Decodable {
    //hits is an array of Post objects
    let hits: [Post]
}

//structure of a HackerNews post
//Post is conform to protocal Identifiable
    //=> Allow list to recognize the order of the post based on id
    //=> Must have variable id

struct Post: Decodable, Identifiable {
    //turning id into onjectID
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
