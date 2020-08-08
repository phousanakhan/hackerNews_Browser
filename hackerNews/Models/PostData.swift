//
//  PostData.swift
//  hackerNews
//
//  Created by Phousanak Han on 06/08/20.
//  Copyright © 2020 Phousanak Han. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
