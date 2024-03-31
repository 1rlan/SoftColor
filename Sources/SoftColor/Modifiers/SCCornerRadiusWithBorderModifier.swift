//
//  SCCornerRadiusWithBorderModifier.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI

public extension View {
    func cornerRadiusWithBorder(
        borderColor: Color,
        radius: SCCornerRadius?,
        borderLineWidth: CGFloat = 1,
        antialiased: Bool = true
    ) -> some View {
        modifier(CornerRadiusWithBorder(borderColor: borderColor, radius: radius, borderLineWidth: borderLineWidth))
    }
}

fileprivate struct CornerRadiusWithBorder: ViewModifier {
    var borderColor: Color
    var radius: SCCornerRadius?
    var borderLineWidth: CGFloat = 1

    func body(content: Content) -> some View {
        content
            .cornerRadius(self.radius?.rawValue ?? SCCornerRadius.medium.rawValue)
            .overlay(
                RoundedRectangle(cornerRadius: self.radius?.rawValue ?? SCCornerRadius.medium.rawValue)
                    .inset(by: self.borderLineWidth)
                    .strokeBorder(self.borderColor, lineWidth: self.borderLineWidth)
        )
    }
}
