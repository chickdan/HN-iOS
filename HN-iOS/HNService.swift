//
//  HNService.swift
//  NewsHack
//
//  Created by Daniel Chick on 7/2/23.
//

import Foundation
import Alamofire

class HNService {
    func getFrontPage(pageNumber: Int) async -> [HNItem]? {
        guard let response = try? await AF.request("https://hn.algolia.com/api/v1/search?tags=front_page").serializingData().value else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: response) as? [String: Any] else { return nil }
        guard let hits = json["hits"], let encoded = try? JSONSerialization.data(withJSONObject: hits) else { return nil }
        
        if let decoded = try? JSONDecoder().decode([HNItem].self, from: encoded) {
            return decoded
        } else {
            return nil
        }
    }
}
