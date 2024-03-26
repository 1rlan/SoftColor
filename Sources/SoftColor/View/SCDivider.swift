//
//  SCDivider.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColorAnalyzer

public struct SCDivider: View, MonochromeAnalyzer {
    public let mainColor: Color

    private let label: String?
    private let horizontalPadding: CGFloat

    public init(label: String? = nil, horizontalPadding: CGFloat = 20, mainColor: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.mainColor = mainColor
    }

    public var body: some View {
        HStack {
            if let label {
                line
                Text(label).foregroundColor(mainColor)
                line
            } else {
                line
            }
        }
        .onAppear {
            analyze()
        }
    }

    var line: some View {
        VStack { Divider().background(mainColor) }.padding(.horizontal, horizontalPadding)
    }
}

public var SCDividerPV: some View {
    VStack(spacing: 50) {
        CenterPreviewContainer(text: "Divider") {
            SCDivider()
        }

        CenterPreviewContainer(text: "Divider with text") {
            SCDivider(label: "Hello world")
        }
    }
}

#Preview {
    SCDividerPV
}
