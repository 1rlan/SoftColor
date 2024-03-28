//
//  SCButton.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColorAnalyzer

public enum ButtonHeight: Double {
    case small = 40
    case meduim = 60
    case large = 80
}

public struct SCButton: View, BiColorAnalyzer {
    public let mainColor: Color
    public let secondaryColor: Color

    private let text: Text
    private let leftImage: Image?
    private let rightImage: Image?
    private let height: ButtonHeight?
    private let cornerRadius: SCCornerRadius?
    private let cornerWidth: CGFloat?
    private let action: (() -> Void)?

    public init(
        mainColor: Color,
        secondaryColor: Color,
        text: Text,
        leftImage: Image? = nil,
        rightImage: Image? = nil,
        height: ButtonHeight? = nil,
        cornerRadius: SCCornerRadius? = nil,
        cornerWidth: CGFloat? = nil,
        action: (() -> Void)? = nil
    ) {
        self.mainColor = mainColor
        self.secondaryColor = secondaryColor
        self.text = text
        self.leftImage = leftImage
        self.rightImage = rightImage
        self.height = height
        self.cornerRadius = cornerRadius
        self.cornerWidth = cornerWidth
        self.action = action
    }

    public var body: some View {
        Button {
            action?()
        } label: {
            HStack(spacing: SCSpacing.small) {
                if let leftImage {
                    leftImage
                        .foregroundColor(mainColor)
                }
                text
                    .foregroundColor(mainColor)
                if let rightImage {
                    rightImage
                        .foregroundColor(mainColor)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: height?.rawValue ?? ButtonHeight.meduim.rawValue)
        .background(secondaryColor)
        .cornerRadiusWithBorder(borderColor: mainColor, radius: cornerRadius, borderLineWidth: cornerWidth ?? 1)
        .onAppear {
            analyze()
        }
    }
}

public var SCButtonPV: some View {
    VStack(spacing: 32) {
        PreviewContainer(text: "Simple small button") {
            SCButton(
                mainColor: .red,
                secondaryColor: .white,
                text: Text("This is red button!"),
                leftImage: nil,
                rightImage: nil,
                height: .small,
                cornerRadius: .medium
            ) {}
        }

        PreviewContainer(text: "Big button") {
            SCButton(
                mainColor: .white,
                secondaryColor: .black,
                text: Text("This is black button!"),
                leftImage: Image(systemName: "eraser"),
                rightImage: nil,
                height: .large,
                cornerRadius: .none
            ) {}
        }

        PreviewContainer(text: "Unusual medium button") {
            SCButton(
                mainColor: .yellow,
                secondaryColor: .purple,
                text: Text("This is purple button!"),
                leftImage: nil,
                rightImage: Image(systemName: "paperplane"),
                height: .meduim,
                cornerRadius: .medium,
                cornerWidth: 4
            ) {}
        }
    }
    .padding(16)
}

#Preview {
    SCButtonPV
}
