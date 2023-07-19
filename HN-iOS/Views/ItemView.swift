//
//  ItemView.swift
//  NewsHack
//
//  Created by Daniel Chick on 7/2/23.
//

import SwiftUI

struct ItemVew: View {
    @State var item: HNItem
    
    var body: some View {
        Text(item.title)
        LinkViewRepresentable(item: item)
    }
}

struct ItemVew_Previews: PreviewProvider {
    static var item = HNItemStore().mockItem
    static var previews: some View {
        ItemVew(item: item)
    }
}
