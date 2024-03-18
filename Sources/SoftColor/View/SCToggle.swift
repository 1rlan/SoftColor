//
//  SCCheckBox.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColorAnalyzer

public enum SCToggleState {
    case `default`
    case checkbox
}

public struct SCToggle: View, MonochromeAnalyzer {
    @Binding private var isChecked: Bool
    public let mainColor: Color

    private let text: Text
    private let isDisabled = false
    private let toggleState: SCToggleState

    public init(isChecked: Binding<Bool>, mainColor: Color, text: Text, toggleState: SCToggleState = .default) {
        self._isChecked = isChecked
        self.mainColor = mainColor
        self.text = text
        self.toggleState = toggleState
    }

    public var body: some View {
        VStack {
            Toggle(isOn: $isChecked) {
                text
                    .foregroundStyle(mainColor)
            }
            .tint(mainColor)
            .if(toggleState != .default) { view in
                view
                    .toggleStyle(SCCheckboxToggleStyle(color: mainColor))
            }
        }
        .onAppear {
            analyze()
        }
    }
}

private struct SCCheckboxToggleStyle: ToggleStyle {
    let color: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .foregroundColor(color)
                .frame(width: 24, height: 24)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}

public var SCTogglePV: some View {
    VStack(spacing: 50) {
        PreviewContainer(text: "Simple checkbox:") {
            @State var isClicked = true
            SCToggle(
                isChecked: $isClicked,
                mainColor: .black,
                text: Text("Choose your candidate")
                    .fontWeight(.heavy),
                toggleState: .checkbox
            )
            .padding(.top, 8)
        }

        PreviewContainer(text: "Unchosen checkbox:") {
            @State var isClicked = false
            SCToggle(
                isChecked: $isClicked,
                mainColor: .indigo,
                text: Text("Your vote for...")
                    .fontWeight(.heavy),
                toggleState: .checkbox
            )
            .padding(.top, 8)
        }

        PreviewContainer(text: "Toggle:") {
            @State var isClicked = false
            SCToggle(
                isChecked: $isClicked,
                mainColor: .orange,
                text: Text("Your vote is...")
                    .fontWeight(.regular),
                toggleState: .default
            )
            .padding(.top, 8)
        }

        PreviewContainer(text: "Toggle:") {
            @State var isClicked = true
            SCToggle(
                isChecked: $isClicked,
                mainColor: .red,
                text: Text("Your vote is...")
                    .fontWeight(.regular),
                toggleState: .default
            )
            .padding(.top, 8)
        }

        Spacer()
    }
    .padding(16)
}

#Preview {
    SCTogglePV
}
