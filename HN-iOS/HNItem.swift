//
//  HNItem.swift
//  NewsHack
//
//  Created by Daniel Chick on 7/2/23.
//

import Foundation

struct HNItem: Codable, Identifiable, Hashable {
    let title: String
    let urlString: String?
    let author: String
    let points: Int
    let commentCount: Int
    let objectID: String
    let createdAt: String?
    
    let id = UUID()
    var url: URL? {
        get {
            if let urlString = urlString {
                return URL(string: urlString)
            } else {
                return nil
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case urlString = "url"
        case author
        case points
        case commentCount = "num_comments"
        case objectID
        case createdAt = "created_at"
    }

}
