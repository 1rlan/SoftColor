//
//  SCStatusState.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI

public enum StatusState: CaseIterable {
    public static var allCases: [StatusState] = [
        .alert, warning, success, info, .custom(text: "HSE", color: .blue, image: Image(systemName: "b.square"))
    ]

    case alert
    case warning
    case success
    case info
    case custom(text: String, color: Color, image: Image)

    var backgroundColor: Color {
        switch self {
        case .alert: .red
        case .warning: .yellow
        case .success: .green
        case .info: .gray
        case .custom(_, let color, _):  color
        }
    }

    var text: some View {
        switch self {
            case .alert: return Text("Alert")
            case .warning: return Text("Warning")
            case .success: return Text("Success")
            case .info: return Text("info")
            case .custom(let text, _, _): return Text(text)
        }
    }

    var icon: some View {
        switch self {
            case .alert: return Image(systemName: "xmark")
            case .warning: return Image(systemName: "exclamationmark.triangle")
            case .success: return Image(systemName: "checkmark")
            case .info: return Image(systemName: "info")
            case .custom(_, _, let image): return image
        }
    }
}
