//
//  HNItemStore.swift
//  NewsHack
//
//  Created by Daniel Chick on 7/2/23.
//

import Foundation
import Combine

class HNItemStore: ObservableObject {
    @Published var items: [HNItem] = []
    
    private let service = HNService()
    private var pageNumber = 0
    
    func load() async {
        if let items = await service.getFrontPage(pageNumber: 0) {
            DispatchQueue.main.async {
                self.items = items
            }
        }
    }
    
    
    
    let mockItem = HNItem(title: "title", urlString: "google.com", author: "author", points: 25, commentCount: 100, objectID: "84949834", createdAt: nil)
}
