//
//  CustomLinkView.swift
//  NewsHack
//
//  Created by Daniel Chick on 7/3/23.
//

import SwiftUI
import LinkPresentation

class CustomLinkView: LPLinkView {
    override var intrinsicContentSize: CGSize { CGSize(width: 0, height: 80) } //super.intrinsicContentSize.height) }
    func set(metadata: LPLinkMetadata) {
        self.metadata = metadata
    }
}

#if os(macOS)
public typealias ViewRepresentable = NSViewRepresentable
#elseif os(iOS)
public typealias ViewRepresentable = UIViewRepresentable
#endif

struct LinkViewRepresentable: ViewRepresentable {
    let item: HNItem
    var metadata: LPLinkMetadata?
    private let backupURL = URL(string: "https://news.ycombinator.com/news")!
    
    func makeNSView(context: Context) -> CustomLinkView {
        return makeLinkView()
    }

    func makeUIView(context: Context) -> CustomLinkView {
        return makeLinkView()
    }
    
    private func makeLinkView() -> CustomLinkView {
        guard let url = item.url else { return CustomLinkView(url: backupURL) }
        let view = CustomLinkView(url: url)
        
        LPMetadataProvider().startFetchingMetadata(for: url) { metadata, error in
            if error == nil, let metadata = metadata {
                DispatchQueue.main.async {
                    view.metadata = metadata
                }
            }
        }

        return view
    }

    func updateNSView(_ nsView: CustomLinkView, context: Context) { }
    func updateUIView(_ uiView: CustomLinkView, context: Context) { }
    
    func fetchPreview(urlString: String) async -> LPLinkMetadata? {
        guard let url = URL(string: urlString) else {
            return nil
        }

        let provider = LPMetadataProvider()
        guard let metadata = try? await provider.startFetchingMetadata(for: url) else { return nil }
        
        return metadata
//        self.metadata = metadata
    //    let linkPreview = await LPLinkView(metadata: metadata)
    }
}

