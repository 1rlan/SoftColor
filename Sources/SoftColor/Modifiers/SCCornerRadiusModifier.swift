//
//  SCCornerRadius.swift
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI

public extension View {
    func cornerRadius(_ radius: SCCornerRadius) -> some View {
        cornerRadius(radius.rawValue)
    }
}
