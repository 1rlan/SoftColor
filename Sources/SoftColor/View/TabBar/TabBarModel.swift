//
//  TabBarModel.swift
//
//  Created by Irlan Abushakhmanov
//

import Foundation

public protocol TabBarModel: CaseIterable, Equatable {
    var tabString: String { get }
    var imageName: String { get }
    var chosenImageName: String { get }
}
