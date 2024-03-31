//
//  View+Extensions.swift
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI

public extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }

    func odsNavigationTitle(_ title: String) -> some View {
        modifier(AccessibleNavigationTitleModifier(title: title))
    }

    func scFont(_ scStyle: SCFontStyle) -> some View {
        modifier(SCFontModifier(fontStyle: scStyle))
    }
}

// RoundedCorner

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct AccessibleNavigationTitleModifier: ViewModifier {
    let title: String

    func body(content: Content) -> some View {
        content
        .navigationTitle(title)
        .onAppear {
            DispatchQueue.main.async {
                UIAccessibility.post(notification: .screenChanged, argument: title)
            }
        }
    }
}
