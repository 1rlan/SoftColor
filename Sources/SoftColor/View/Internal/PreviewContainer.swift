//
//  PreviewContainer.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI

struct PreviewContainer<Content: View>: View {
    let text: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .fontWeight(.light)
            content
        }
    }
}

struct CenterPreviewContainer<Content: View>: View {
    let text: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .center) {
            Text(text)
                .fontWeight(.light)
            content
        }
    }
}
