//
//  FlowGuideline.swift
//  SoftColorDemo
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI

struct ColorsGuideline: Guideline {
    let name: String
    let imageName: String
    let description: String
    let pageDescription: AnyView

    init() {
        name = "Colors"
        imageName = "Colour"
        description = "On this screen you can see the color recognition system (brightness and color matching)"
        pageDescription = AnyView(ColorView())
    }
}

struct TypographyGuideline: Guideline {
    let name: String
    let imageName: String
    let description: String
    let pageDescription: AnyView

    init() {
        name = "Typography"
        imageName = "Typography"
        description = "This page is a collection of all fonts used in the application"
        pageDescription = AnyView(FontView())
    }
}

struct SpacingsGuideline: Guideline {
    let name: String
    let imageName: String
    let description: String
    let pageDescription: AnyView

    init() {
        name = "Spacings"
        imageName = "Spacing"
        description = "This screen is responsible for showing the dimensions of the various empty spaces (SCSpacing)"
        pageDescription = AnyView(SpacingView())
    }
}
