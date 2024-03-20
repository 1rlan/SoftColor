//
//  SwiftUIView.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColorAnalyzer

public struct SCStatus: View, MonochromeAnalyzer {
    public let mainColor: Color
    
    private let statusState: StatusState
    private let showText: Bool
    private var iconSize: CGFloat {
        24
    }

    public init(statusState: StatusState, showText: Bool) {
        self.mainColor = statusState.backgroundColor
        self.statusState = statusState
        self.showText = showText
    }

    public var body: some View {
        HStack(spacing: 0) {
            statusState
                .icon
                .frame(minWidth: iconSize * 1.6, minHeight: iconSize * 1.6)
            if showText {
                VStack {
                    statusState
                        .text
                }
                .padding(8)
                .background(.white.opacity(0.95))
                .cornerRadius(1, corners: [.bottomRight, .topRight])
                .padding(1)
            }
        }
        .background(statusState.backgroundColor)
        .cornerRadius(2)
    }
}

public var SCStatusPV: some View {
    CenterPreviewContainer(text: "Status icons:") {
        ForEach(StatusState.allCases, id: \.backgroundColor) { state in
            HStack {
                Spacer()
                SCStatus(statusState: state, showText: true)
                Spacer()
                SCStatus(statusState: state, showText: false)
                Spacer()
            }
        }
    }
    .padding(16)
}

#Preview {
    SCStatusPV
}
