//
//  BiColorAnalyzer.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI

public protocol BiColorAnalyzer {
    var mainColor: Color { get }
    var secondaryColor: Color { get }

    func analyze(shouldSkip: Bool, file: String)
}

public extension BiColorAnalyzer {
    func analyze(shouldSkip: Bool = false, file: String = #file) {
        guard !shouldSkip else { return }

        _ = ColorAnalyzer(state: .biColor(mainColor: mainColor, secondaryColor: secondaryColor), file: file)
    }
}
