//
//  Color+Extensions.swift
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI

public extension Color {
    var hsba: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        let color = UIColor(self)
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        color.getHue(
            &hue,
            saturation: &saturation,
            brightness: &brightness,
            alpha: &alpha
        )
        return (hue, saturation, brightness, alpha)
    }

    var gradeShade: Double {
        let rawComponents = rgba.dropLast().map { rawValue in
            return rawValue <= 0.03928
            ? rawValue / 12.92
            : pow((rawValue + 0.055) / 1.055, 2.4)
        }
        return rawComponents[0] * 0.2126 + rawComponents[1] * 0.7152 + rawComponents[2] * 0.0722
    }

    private var rgba: [CGFloat] {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        (UIColor(self)).getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return [red, green, blue, alpha]
    }
}
