//
//  Luminance.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI

enum AnalyzeState {
    case monochrome(mainColor: Color)
    case biColor(mainColor: Color, secondaryColor: Color)
}

final class ColorAnalyzer {
    private enum Constants {
        static let colorsMatchThreshold = 4.5
        static let saturationThreshold = 0.5
    }

    private let state: AnalyzeState
    private let file: String

    init(state: AnalyzeState, file: String) {
        self.state = state
        self.file = file

        analyze()
    }

    private func analyze() {
        switch state {
        case .monochrome(let mainColor):
            check(color: mainColor)
        case .biColor(let mainColor, let secondaryColor):
            check(color: mainColor)
            check(color: secondaryColor)
            check(firstColor: mainColor, secondColor: secondaryColor)
        }
    }

    private func check(firstColor: Color, secondColor: Color) {
        let firstColorGradeShade = firstColor.gradeShade
        let secondColorLuminance = secondColor.gradeShade

        let ratio = firstColorGradeShade > secondColorLuminance
            ? ((secondColorLuminance + 0.05) / (firstColorGradeShade + 0.05))
            : ((firstColorGradeShade + 0.05) / (secondColorLuminance + 0.05))

        let invertedRatio = 1 / ratio

        if invertedRatio < Constants.colorsMatchThreshold {
            logBiColorError(with: invertedRatio)
        }
    }

    private func check(color: Color) {
        let saturation = color.hsba.saturation

        if saturation > Constants.saturationThreshold {
            logMonochromeError(with: saturation)
        }
    }

    private func logBiColorError(with value: Double) {
        LogColorInfo(
            "The colors don't match. Ratio is \(value) (< \(Constants.colorsMatchThreshold))",
            file: file
        )
    }

    private func logMonochromeError(with value: Double) {
        LogColorInfo(
            "The color is too saturated. Saturation is \(value) (> \(Constants.saturationThreshold))",
            file: file
        )
    }
}
