//
//  SCFontModifier.swift
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI

struct SCFontModifier: ViewModifier {
    private let fontStyle: SCFontStyle

    init(fontStyle: SCFontStyle) {
        self.fontStyle = fontStyle
    }

    func body(content: Content) -> some View {
        content.font(font(fontStyle))
    }

    private func font(_ style: SCFontStyle) -> Font {
        switch style {
        case .headlineL:
            return Font.largeTitle.bold()
        case .titleL:
            return Font.title.bold()
        case .titleM:
            return Font.title2.bold()
        case .titleS:
            return Font.title3.bold()
        case .headlineS:
            return Font.headline.bold()
        case .bodyLBold:
            return Font.body.bold()
        case .bodyLRegular:
            return Font.body
        case .bodyM:
            return Font.callout
        case .bodyS:
            return Font.subheadline.bold()
        case .labelL:
            return Font.footnote
        case .labelMBold:
            return Font.caption.bold()
        case .labelMRegular:
            return Font.caption
        case .labelS:
            return Font.caption2
        }
    }
}
