//
//  SCTextField.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColorAnalyzer

public struct SCTextField: View, BiColorAnalyzer {
    @Binding var text: String
    @FocusState var focused: Bool

    public let mainColor: Color
    public let secondaryColor: Color

    private let placeholder: String
    private let cornerRadius: SCCornerRadius?
    private let cornerWidth: CGFloat?
    private let isSecure: Bool
    private let shouldShowCloseButton: Bool

    public init(
        mainColor: Color,
        secondaryColor: Color,
        text: Binding<String>,
        placeholder: String,
        cornerRadius: SCCornerRadius? = nil,
        cornerWidth: CGFloat? = nil,
        isSecure: Bool = false,
        shouldShowCloseButton: Bool = false
    ) {
        self.mainColor = mainColor
        self.secondaryColor = secondaryColor
        self._text = text
        self.placeholder = placeholder
        self.cornerRadius = cornerRadius
        self.cornerWidth = cornerWidth
        self.isSecure = isSecure
        self.shouldShowCloseButton = shouldShowCloseButton
    }

    public var body: some View {
        let isActive = focused || text.count > 0

        ZStack(alignment: .trailing) {
            ZStack(alignment: isActive ? .topLeading : .center) {
                if isSecure {
                    SecureField(String.empty, text: $text)
                        .frame(height: 24)
                        .font(.system(size: 16, weight: .regular))
                        .opacity(isActive ? 1 : 0)
                        .offset(y: 7)
                        .focused($focused)
                } else {
                    TextField(String.empty, text: $text)
                        .frame(height: 24)
                        .font(.system(size: 16, weight: .regular))
                        .opacity(isActive ? 1 : 0)
                        .offset(y: 7)
                        .focused($focused)
                }


                HStack {
                    Text(placeholder)
                        .foregroundColor(.black.opacity(0.3))
                        .frame(height: 16)
                        .font(.system(size: isActive ? 12 : 16, weight: .regular))
                        .offset(y: isActive ? -7 : 0)
                    Spacer()
                }
            }
            .onTapGesture {
                focused = true
            }
            .animation(.linear(duration: 0.2), value: focused)
            .frame(height: 56)
            .padding(.horizontal, 16)
            .background(secondaryColor)
            .cornerRadiusWithBorder(
                borderColor: mainColor,
                radius: cornerRadius ?? .medium,
                borderLineWidth: cornerWidth ?? 0
            )

            if shouldShowCloseButton {
                Button(action: {
                    text = .empty
                }, label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                        .foregroundColor(mainColor)
                        .offset(x: -14, y: 0)
                })
            }
        }
        .onAppear {
            analyze()
        }
    }
}

public var SCTextFieldPV: some View {
    VStack(alignment: .center, spacing: 32) {
        PreviewContainer(text: "Simple text field:") {
            @State var internalText = String()
            SCTextField(
                mainColor: .gray.opacity(0.6),
                secondaryColor: .gray.opacity(0.1),
                text: $internalText,
                placeholder: "Email",
                cornerWidth: 1
            )
        }

        PreviewContainer(text: "Protected text field:") {
            @State var internalText = String()
            SCTextField(
                mainColor: .blue.opacity(0.3),
                secondaryColor: .blue.opacity(0.3),
                text: $internalText,
                placeholder: "Password",
                isSecure: true
            )
        }

        PreviewContainer(text: "Text field with button:") {
            @State var internalText = String()
            SCTextField(
                mainColor: .orange,
                secondaryColor: .pink.opacity(0.07),
                text: $internalText,
                placeholder: "Some information about you",
                cornerRadius: .zero,
                cornerWidth: 1,
                isSecure: true,
                shouldShowCloseButton: true
            )
        }
    }
    .padding(16)
}

#Preview {
    SCTextFieldPV
}
