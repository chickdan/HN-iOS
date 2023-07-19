//
//  RowItem.swift
//  NewsHack
//
//  Created by Daniel Chick on 7/2/23.
//

import SwiftUI

struct RowItem: View {
    let item: HNItem

    var body: some View {
        NavigationLink(value: item) {
            HStack {
                LinkViewRepresentable(item: item)
                    .frame(width: 80, height: 80)
                VStack {
                    if let scheme = item.url?.host() {
                        Text(scheme).frame(maxWidth: .infinity, alignment: .topLeading)
                            .foregroundStyle(.blue.gradient)
                            .padding(.bottom, 2)
                    }
                    Text(item.title).frame(maxWidth: .infinity, alignment: .topLeading)
                    HStack {
                        Text(item.author)
                        Text("* \(item.objectID)")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.gray)
                        .padding(.top, 2)

                    HStack {
                        Text("^ \(item.points)")
                        Text("* Comments: \(item.commentCount)")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.gray)
                        .padding(.top, 2)
                    #if os(macOS)
                    Divider()
                    #endif
                }
            }.padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
        }
    }
}

struct RowItem_Previews: PreviewProvider {
    static var item = HNItemStore().mockItem
    static var previews: some View {
        RowItem(item: item)
    }
}
