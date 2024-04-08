//
//  Guide.swift
//  SoftColorDemo
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI

protocol Guideline {
    var name: String { get }
    var imageName: String { get }
    var description: String { get }
    var pageDescription: AnyView { get }
}

extension Guideline {
    var id: String { name }
}
