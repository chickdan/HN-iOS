//
//  NewsView.swift
//  NewsHack
//
//  Created by Daniel Chick on 7/2/23.
//

import SwiftUI

struct NewsView: View {
    @StateObject var store = HNItemStore()
//    @EnvironmentObject var estore: HNItemStore
//    var fitleredItems: [HNItem] {
//        store.items.filter { item in
//            true
////            (!showFavoritesOnly || landmark.isFavorite)
//        }
//    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            
//            List {
//                ForEach(estore.items) { item in
//                    RowItem(item: item)
//                        .navigationDestination(for: HNItem.self) { item in
//                            ItemVew(item: item)
//                        }
//                }
//            }
            
            List($store.items) { $item in
                RowItem(item: item)
            }
            .navigationDestination(for: HNItem.self) { item in
                ItemVew(item: item)
            }
        }.task {
            await store.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView() //.environmentObject(HNItemStore())
    }
}
