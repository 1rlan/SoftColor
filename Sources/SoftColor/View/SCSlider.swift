//
//  SCSlider.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColorAnalyzer

public struct SCSlider<Value> where Value: BinaryFloatingPoint, Value.Stride: BinaryFloatingPoint {
    @Binding private var value: Value
    @State private var isEditing: Bool {
        didSet {
            onEdit(isEditing)
        }
    }

    public let mainColor: Color
    public let secondaryColor: Color

    private let range: ClosedRange<Value>
    private let minimumValueLabel: Image?
    private let maximumValueLabel: Image?
    private let onEdit: (Bool) -> Void
    private let step: Value.Stride?

    private let values: [Value]?

    public init(
        mainColor: Color,
        secondaryColor: Color,
        value: Binding<Value>,
        in bounds: ClosedRange<Value> = 0 ... 1,
        minimumValueLabel: Image? = nil,
        maximumValueLabel: Image? = nil,
        onEdit: @escaping (Bool) -> Void = { _ in }
    ) {
        _value = value
        range = bounds
        step = nil
        self.mainColor = mainColor
        self.secondaryColor = secondaryColor
        self.onEdit = onEdit
        self.minimumValueLabel = minimumValueLabel
        self.maximumValueLabel = maximumValueLabel

        values = nil
        _isEditing = State(initialValue: false)
    }
}

extension SCSlider: View, BiColorAnalyzer {
    public var body: some View {
        VStack {
            HStack(alignment: .center) {
                minimumValueLabel
                    .foregroundColor(secondaryColor)
                GeometryReader { geometry in
                    slider
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in
                                    let newValue = computeNewValue(for: value.location.x, in: geometry.size.width)
                                    if !isEditing {
                                        if newValue != self.$value.wrappedValue {
                                            self.isEditing = true
                                        }
                                    }

                                    self.$value.wrappedValue = newValue
                                }
                                .onEnded { value in
                                    self.$value.wrappedValue = computeNewValue(
                                        for: value.location.x,
                                        in: geometry.size.width
                                    )
                                    self.isEditing = false
                                }
                        )
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height,
                            alignment: .center)
                }

                maximumValueLabel
                    .foregroundColor(secondaryColor)
            }
        }
        .frame(maxHeight: 40)
        .onAppear {
            analyze()
        }
    }

    @ViewBuilder
    var slider: some View {
        if let step = self.step {
            Slider(value: $value, in: range, step: step)
                .accentColor(mainColor)
        } else {
            Slider(value: $value, in: range)
                .accentColor(mainColor)
        }
    }

    private func computeNewValue(for xPosition: Double, in globalWidth: Double) -> Value {
        if xPosition >= globalWidth {
            return range.upperBound
        } else {
            if xPosition <= 0 {
                return range.lowerBound
            } else {
                let percent = xPosition / globalWidth
                let computedValue = (Value(percent) * (range.upperBound - range.lowerBound)) + range.lowerBound

                return adjustNewValue(from: computedValue)
            }
        }
    }

    private func adjustNewValue(from computedValue: Value) -> Value {
        guard let values = values else {
            return computedValue
        }

        var newValue = computedValue
        var distance: Value.Stride = .infinity

        for value in values {
            let newDistance = value.distance(to: computedValue)
            if abs(newDistance) < abs(distance) {
                distance = newDistance
                newValue = value
            } else {
                return newValue
            }
        }

        return newValue
    }
}

public var SCSliderPV: some View {
    VStack(spacing: 32) {
        PreviewContainer(text: "Slider with 2 pics") {
            SCSlider(
                mainColor: .red,
                secondaryColor: .red,
                value: .constant(0.9),
                minimumValueLabel: Image(systemName: "speaker.wave.1.fill"),
                maximumValueLabel: Image(systemName: "speaker.wave.3.fill")
            )
        }

        PreviewContainer(text: "Slider with 1 pic") {
            SCSlider(
                mainColor: .yellow,
                secondaryColor: .black,
                value: .constant(0.55),
                minimumValueLabel: Image(systemName: "speaker.wave.1.fill")
            )
        }

        PreviewContainer(text: "Slider without pics") {
            SCSlider(
                mainColor: .blue,
                secondaryColor: .red,
                value: .constant(0.2)
            )
        }
    }
    .padding(16)
}

#Preview {
    SCSliderPV
}
