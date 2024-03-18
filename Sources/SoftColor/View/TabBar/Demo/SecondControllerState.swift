//
//  SecondControllerState.swift
//
//
//  Created by Irlan Abushakhmanov 
//

import Foundation

enum TabBarState2: TabBarModel {
    case folder
    case telega
    case person


    public var tabString: String {
        switch self {
        case .folder:
            return "Folder"
        case .telega:
            return "Paperplane"
        case .person:
            return "Person"
        }
    }

    public var imageName: String {
        switch self {
        case .folder:
            return "folder.circle"
        case .telega:
            return "paperplane"
        case .person:
            return "person.badge.shield.checkmark"
        }
    }

    public var chosenImageName: String {
        imageName + ".fill"
    }
}
