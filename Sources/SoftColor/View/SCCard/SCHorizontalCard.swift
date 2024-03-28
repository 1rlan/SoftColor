//
//  SCHorizontalCard.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColorAnalyzer

public struct SCHorizontalCard: View, BiColorAnalyzer {
    public let mainColor: Color
    public let secondaryColor: Color

    private let image: Image?
    private let title: String
    private let subtitle: String
    private let desc: String?
    private let cornerRadius: SCCornerRadius?
    private let cornerWidth: CGFloat?

    public init(
        mainColor: Color,
        secondaryColor: Color,
        image: Image? = nil,
        title: String,
        subtitle: String,
        desc: String? = nil,
        cornerRadius: SCCornerRadius? = nil,
        cornerWidth: CGFloat? = nil
    ) {
        self.mainColor = mainColor
        self.secondaryColor = secondaryColor
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
        self.cornerRadius = cornerRadius
        self.cornerWidth = cornerWidth
    }

    public var body: some View {
        HStack {
            if let image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(width: 100)
                    .padding([.bottom, .leading, .top], 20)
            }

            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 26, weight: .bold, design: .default))
                    .foregroundColor(mainColor)
                Text(subtitle)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(mainColor.opacity(0.70))
                HStack {
                    if let desc {
                        Text(desc)
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .foregroundColor(mainColor.opacity(0.70))
                            .padding(.top, 8)
                    }
                }
            }
            .padding(20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(secondaryColor)
        .cornerRadiusWithBorder(borderColor: mainColor, radius: cornerRadius, borderLineWidth: cornerWidth ?? 0)
        .modifier(SCCardModifier())
        .onAppear {
            analyze()
        }
    }
}

public let SCHorizontalCardPreview: some View = VStack(spacing: 16) {
    PreviewContainer(text: "Card without image") {
        SCHorizontalCard(
            mainColor: .white,
            secondaryColor: Color(red: 32/255, green: 36/255, blue: 38/255),
            title: "Steak",
            subtitle: "From our kitchen",
            desc: "$123.00"
        )
    }

    PreviewContainer(text: "Card with image") {
        SCHorizontalCard(
            mainColor: .white,
            secondaryColor: Color(red: 32/255, green: 36/255, blue: 38/255),
            image: .image1,
            title: "Steak",
            subtitle: "From our kitchen",
            desc: "$123.00",
            cornerRadius: .small
        )
    }

    PreviewContainer(text: "Custom card") {
        SCHorizontalCard(
            mainColor: .orange,
            secondaryColor: .white,
            image: .image2,
            title: "Shtuchki",
            subtitle: "From our kitchen",
            desc: "$123.00",
            cornerRadius: .large,
            cornerWidth: 1
        )
    }
}
.padding(.horizontal, 16)

#Preview {
    SCHorizontalCardPreview
}
