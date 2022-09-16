//
//  NewsModel.swift
//  H4X0R-News
//
//  Created by Battal Uçar on 12.09.2022.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let author: String
    let type: String?
    let points: Int
    let url: String?
}
