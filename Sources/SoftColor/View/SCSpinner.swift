//
//  SCSpinner.swift
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI
import SoftColorAnalyzer

public struct SCSpinner: View, BiColorAnalyzer {
    @State private var degree: Int = 270
    @State private var offset: CGFloat = 0
    @State private var spinnerLength = 0.6

    public let mainColor: Color
    public let secondaryColor: Color

    // MARK: - Body
    public var body: some View {
        Circle()
        .trim(from: 0.0, to: spinnerLength)
        .stroke(
            LinearGradient(
                colors: [mainColor, secondaryColor],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            style: StrokeStyle(
                lineWidth: 8.0,
                lineCap: .round
            )
        )
        .animation(
            .easeIn(duration: 1.5)
            .repeatForever(autoreverses: true)
        )
        .frame(width: 60, height: 60)
        .rotationEffect(Angle(degrees: Double(degree)))
        .animation(
            .linear(duration: 1)
            .repeatForever(autoreverses: false)
        )
        .onAppear{
            degree = 270 + 360
            spinnerLength = 0
        }
        .offset(y: offset)
        .onAppear {
            analyze()
        }
    }
}

public var SCSpinnerPV: some View {
    VStack(alignment: .center, spacing: 64) {
        CenterPreviewContainer(text: "Monochrome spinner") {
            SCSpinner(mainColor: .blue, secondaryColor: .blue)
                .padding(.top, 16)
        }

        CenterPreviewContainer(text: "BiColor spinner") {
            SCSpinner(mainColor: .teal, secondaryColor: .orange)
                .padding(.top, 16)
        }
    }
    .padding(16)
}

#Preview {
    SCSpinnerPV
}
