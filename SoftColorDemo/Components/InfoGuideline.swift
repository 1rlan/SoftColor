//
//  InfoGuideline.swift
//  SoftColorDemo
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI

struct RegistrationGuideline: Guideline {
    let name: String
    let imageName: String
    let description: String
    let pageDescription: AnyView

    init() {
        name = "Registration"
        imageName = "il_recirculation"
        description = "Demonstration of the registration screen in the application using SoftColor library"
        pageDescription = AnyView(RegistrationView())
    }
}

struct MenuGuideline: Guideline {
    let name: String
    let imageName: String
    let description: String
    let pageDescription: AnyView

    init() {
        name = "Menu"
        imageName = "il_emptyState"
        description = "This screen shows an example of an area for ordering with delivery service"
        pageDescription = AnyView(ShopView())
    }
}
