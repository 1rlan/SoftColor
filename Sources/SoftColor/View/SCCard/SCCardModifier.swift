//
//  SCCardModifier.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI

struct SCCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}
