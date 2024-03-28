//
//  SCVerticalCardView.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColorAnalyzer

public struct SCVerticalCardView: View, BiColorAnalyzer {
    public let mainColor: Color
    public let secondaryColor: Color

    private let image: Image
    private let title: String
    private let subtitle: String
    private let desc: String?
    private let cornerRadius: SCCornerRadius?
    private let cornerWidth: CGFloat?

    public init(
        mainColor: Color,
        secondaryColor: Color,
        image: Image,
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
        VStack(alignment: .leading) {
            ZStack {
                mainColor
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }

            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(mainColor)
                Text(subtitle)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 12, weight: .bold, design: .default))
                    .foregroundColor(mainColor.opacity(0.70))
            }
            .padding([.leading, .bottom, .trailing])
        }
        .background(secondaryColor)
        .modifier(SCCardModifier())
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius?.rawValue ?? SCCornerRadius.medium.rawValue))
        .onAppear {
            analyze()
        }
    }
}

public let SCVerticalCardViewPV: some View =
    ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 40) {
            CenterPreviewContainer(text: "Custom card") {
                SCVerticalCardView(
                    mainColor: .white,
                    secondaryColor: Color(red: 32/255, green: 36/255, blue: 38/255),
                    image: .image4,
                    title: "Steak",
                    subtitle: "From our kitchen",
                    desc: "$123.00"
                )
            }
            .frame(width: 220, height: 320)

            CenterPreviewContainer(text: "Also custom card") {
                SCVerticalCardView(
                    mainColor: .orange,
                    secondaryColor: .white,
                    image: .image2,
                    title: "Shtuchki",
                    subtitle: "From our kitchen",
                    desc: "$123.00",
                    cornerWidth: 10
                )
            }
            .frame(width: 220, height: 320)
        }
        .padding(.horizontal, 16)
    }


#Preview {
    SCVerticalCardViewPV
}
