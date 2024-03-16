//
//  MonochromeAnalyzer.swift
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI

public protocol MonochromeAnalyzer {
    var mainColor: Color { get }

    func analyze(shouldSkip: Bool, file: String)
}

public extension MonochromeAnalyzer {
    func analyze(shouldSkip: Bool = false, file: String = #function) {
        guard !shouldSkip else { return }
        
        _ = ColorAnalyzer(state: .monochrome(mainColor: mainColor), file: file)
    }
}
