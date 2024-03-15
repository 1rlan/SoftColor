//
//  BiColorAnalyzer.swift
//
//  Created by Irlan Abushakhmanov on 15.11.2023.
//

import SwiftUI

public protocol BiColorAnalyzer {
    var mainColor: Color { get }
    var secondaryColor: Color { get }

    func analyze()
}

public extension BiColorAnalyzer {
    func analyze() {
        fatalError()
    }
}
