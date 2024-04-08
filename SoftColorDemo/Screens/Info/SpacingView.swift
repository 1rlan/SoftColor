//
//  SpacingView.swift
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI

struct SpacingView: View {
    private let spacings = Spacing.allCases

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(spacings, id: \.rawValue) { spacing in
                SpacingItem(spacing: spacing)
            }
            .padding(.horizontal, 16)
        }
        .padding(.bottom, 16)
        .accessibilityRespondsToUserInteraction(false) 
    }
}

private struct SpacingItem: View {
    let spacing: Spacing

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            HStack(spacing: 16) {
                SpacingVisual(spacing: spacing)

                VStack(alignment: .leading) {
                    Text(spacing.name)
                        .scFont(.bodyLRegular)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(spacing.rawValue, specifier: "%.0f") px").scFont(.bodyLRegular)
                }

                Spacer()

                Text(spacing.ratio)
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .scFont(.bodyLRegular)
            }
            .padding(.top, 8)

            Divider()
        }
    }
}

private struct SpacingVisual: View {
    let spacing: Spacing

    private var spacingWidth: Double {
        spacing == .none ? spacing.rawValue + 1 : spacing.rawValue
    }

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black.opacity(0.80))
                .frame(height: 16, alignment: .topLeading)

            Rectangle()
                .foregroundColor(.blue)
                .frame(width: spacingWidth, alignment: .center)
        }
        .frame(width: 60, height: 50)
        .background(Color(UIColor.tertiarySystemFill))
    }
}

private enum Spacing: Double, CaseIterable {
    case none
    case xs
    case s
    case m
    case l
    case xl
    case xxl

    var rawValue: Double {
        switch self {
        case .none: return 0
        case .xs: return 4
        case .s: return 8
        case .m: return 16
        case .l: return 24
        case .xl: return 32
        case .xxl: return 40
        }
    }

    var name: String {
        switch self {
        case .none: return "spacing-none"
        case .xs: return "spacing-xs"
        case .s: return "spacing-s"
        case .m: return "spacing-m"
        case .l: return "spacing-l"
        case .xl: return "spacing-xl"
        case .xxl: return "spacing-xxl"
        }
    }

    var ratio: String {
        switch self {
        case .none: return "Ratio -"
        case .xs: return "Ratio 0.5"
        case .s: return "Ratio 1"
        case .m: return "Ratio 2"
        case .l: return "Ratio 3"
        case .xl: return "Ratio 4"
        case .xxl: return "Ratio 5"
        }
    }

    var ratioSpokenValue: String {
        switch self {
        case .none: return "0"
        case .xs: return "0.5"
        case .s: return "1"
        case .m: return "2"
        case .l: return "3"
        case .xl: return "4"
        case .xxl: return "5"
        }
    }
}
