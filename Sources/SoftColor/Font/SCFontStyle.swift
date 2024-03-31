//
//  SCFontStyle.swift
//
//  Created by Irlan Abushakhmanov
//

import Foundation

public enum SCFontStyle: String, CaseIterable {
    case headlineL
    case headlineS
    case titleL
    case titleM
    case titleS
    case bodyLBold
    case bodyLRegular
    case bodyM
    case bodyS
    case labelL
    case labelMBold
    case labelMRegular
    case labelS

    public var description: String {
        switch self {
        case .headlineL:
            return "Headline L"
        case .titleL:
            return "Title L"
        case .titleM:
            return "Title M"
        case .titleS:
            return "Title S"
        case .headlineS:
            return "Headline S"
        case .bodyLRegular:
            return "Body L Regular"
        case .bodyLBold:
            return "Body L Bold"
        case .bodyM:
            return "Body M"
        case .bodyS:
            return "Body S"
        case .labelL:
            return "Label L"
        case .labelMRegular:
            return "Label M Regular"
        case .labelMBold:
            return "Label M Bold"
        case .labelS:
            return "Label S"
        }
    }
}
