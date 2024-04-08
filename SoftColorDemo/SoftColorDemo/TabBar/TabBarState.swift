//
//  TabBarState.swift
//  
//  Created by Irlan Abushakhmanov
//

import SoftColor

enum TabBarState: TabBarModel {
    case signal
    case translate
    case training
    case settings


    public var tabString: String {
        switch self {
        case .signal:
            return "Conversion"
        case .translate:
            return "Translation"
        case .training:
            return "Training"
        case .settings:
            return "Settings"
        }
    }

    public var imageName: String {
        switch self {
        case .signal:
            return "sun.max"
        case .translate:
            return "doc.plaintext"
        case .training:
            return "book"
        case .settings:
            return "gearshape"
        }
    }

    public var chosenImageName: String {
        imageName + ".fill"
    }
}
