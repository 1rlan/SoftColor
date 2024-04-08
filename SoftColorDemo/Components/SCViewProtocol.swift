//
//  SCViewProtocol.swift
//  SoftColorDemo
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI
import SoftColor

protocol SCViewProtocol {
    var name: String { get }
    var view: AnyView { get }
}

struct SCHorizontalCardVP: SCViewProtocol {
    let name: String
    let view: AnyView

    init() {
        name = "SCHorizontalCard"
        view = AnyView(SCHorizontalCardPreview)
    }
}

struct SCVerticalCardVP: SCViewProtocol {
    let name: String
    let view: AnyView

    init() {
        name = "SCVerticalCard"
        view = AnyView(SCVerticalCardViewPV)
    }
}

struct SCStatusVP: SCViewProtocol {
    let name: String
    let view: AnyView

    init() {
        name = "SCStatus"
        view = AnyView(SCStatusPV)
    }
}

struct SCTabBarVP: SCViewProtocol {
    let name: String
    let view: AnyView

    init() {
        name = "SCTabBar"
        view = AnyView(TabBarPV)
    }
}

struct SCBannerVP: SCViewProtocol {
    let name: String
    let view: AnyView

    init() {
        name = "SCBanner"
        view = AnyView(SCBannerPV)
    }
}

struct SCButtonVP: SCViewProtocol {
    let name: String
    let view: AnyView

    init() {
        name = "SCButton"
        view = AnyView(SCButtonPV)
    }
}

struct SCSegmentedPickerVP: SCViewProtocol {
    let name: String
    let view: AnyView

    init() {
        name = "SCSegmentedPicker"
        view = AnyView(SCSegmentedPickerPV)
    }
}

struct SCSliderVP: SCViewProtocol {
    let name: String
    let view: AnyView

    init() {
        name = "SCSlider"
        view = AnyView(SCSliderPV)
    }
}

struct SCSpinnerVP: SCViewProtocol {
    let name: String
    let view: AnyView

    init() {
        name = "SCSpinner"
        view = AnyView(SCSpinnerPV)
    }
}

struct SCTextFieldVP: SCViewProtocol {
    let name: String
    let view: AnyView

    init() {
        name = "SCTextField"
        view = AnyView(SCTextFieldPV)
    }
}

struct SCToggleVP: SCViewProtocol {
    let name: String
    let view: AnyView

    init() {
        name = "SCToggle"
        view = AnyView(SCTogglePV)
    }
}

struct SCDividerVP: SCViewProtocol {
    let name: String
    let view: AnyView

    init() {
        name = "SCDivider"
        view = AnyView(SCDividerPV)
    }
}
