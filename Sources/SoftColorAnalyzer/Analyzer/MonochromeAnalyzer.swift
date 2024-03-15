//
//  MonochromeAnalyzer.swift
//
//  Created by Irlan Abushakhmanov on 15.11.2023.
//

import SwiftUI

public protocol MonochromeAnalyzer {
    var mainColor: Color { get }

    func analyze()
}

public extension MonochromeAnalyzer {
    func analyze() {
        fatalError()
    }
}
