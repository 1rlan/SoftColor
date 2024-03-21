//
//  SCBanner.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColorAnalyzer

public struct SCBanner: View, BiColorAnalyzer {
    public let mainColor: Color
    public let secondaryColor: Color

    private let text: Text
    private let secondaryText: Text?
    private let shouldShowCloseButton: Bool
    private let cornerRadius: SCCornerRadius?
    private let cornerWidth: CGFloat?
    private let tapAction: (() -> Void)?
    private let closeAction: (() -> Void)?

    public init(
        mainColor: Color,
        secondaryColor: Color,
        text: Text,
        secondaryText: Text? = nil,
        shouldShowCloseButton: Bool = false,
        cornerRadius: SCCornerRadius? = nil,
        cornerWidth: CGFloat? = nil,
        tapAction: (() -> Void)? = nil,
        closeAction: (() -> Void)? = nil
    ) {
        self.mainColor = mainColor
        self.secondaryColor = secondaryColor
        self.text = text
        self.secondaryText = secondaryText
        self.shouldShowCloseButton = shouldShowCloseButton
        self.cornerRadius = cornerRadius
        self.cornerWidth = cornerWidth
        self.tapAction = tapAction
        self.closeAction = closeAction
    }


    public var body: some View {
        VStack(alignment: .leading) {
            text
                .foregroundStyle(mainColor)
            if let secondaryText {
                secondaryText
                    .foregroundStyle(mainColor)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .if(shouldShowCloseButton) { view in
            view.appendCloseButton(color: mainColor, onTap: closeAction)
        }
        .background(secondaryColor)
        .cornerRadiusWithBorder(borderColor: mainColor, radius: cornerRadius, borderLineWidth: cornerWidth ?? 0)
        .onAppear {
            analyze()
        }
    }
}

private struct CloseButtonModifier: ViewModifier {
    let color: Color
    let onTap: (() -> Void)?

    func body(content: Content) -> some SwiftUI.View {
        content
        .background(
            VStack {
                HStack(alignment: .top) {
                    Spacer()
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                        .foregroundColor(color)

                    .onTapGesture {
                        onTap?()
                    }
                }
                Spacer()
            }
            .offset(x: -14, y: 14)
        )
    }
}

private extension SwiftUI.View {
    func appendCloseButton(color: Color, onTap: (() -> Void)? = nil) -> some SwiftUI.View {
        ModifiedContent(content: self, modifier: CloseButtonModifier(color: color, onTap: onTap))
    }
}

public var SCBannerPV: some View {
    VStack(spacing: 32) {
        PreviewContainer(text: "Simple banner only with text:") {
            SCBanner(
                mainColor: .orange,
                secondaryColor: .white,
                text: Text("This is only title"),
                cornerWidth: 2
            )
        }

        PreviewContainer(text: "Big info banner:") {
            SCBanner(
                mainColor: .white,
                secondaryColor: .blue,
                text: Text("This is only title").fontWeight(.bold),
                secondaryText: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque dignissim justo nulla, at semper eros laoreet eget. Quisque pharetra vestibulum gravida. Donec ac metus et nisi finibus maximus sit amet vel nisi. Suspendisse dapibus tincidunt facilisis. Sed pellentesque sapien odio.")
                    .fontWeight(.light),
                shouldShowCloseButton: true,
                cornerRadius: .medium
            )
        }

        PreviewContainer(text: "Unusual banner:") {
            SCBanner(
                mainColor: .green,
                secondaryColor: .white,
                text: Text("This is only title").font(.largeTitle),
                secondaryText: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                    .font(.callout),
                shouldShowCloseButton: true,
                cornerWidth: 2
            )
        }
    }
    .padding(16)
}

#Preview {
    SCBannerPV
}
