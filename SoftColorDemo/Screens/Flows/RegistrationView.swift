//
//  RegistrationView.swift
//  SoftColorDemo
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColor

struct RegistrationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack(spacing: 20) {

            Image("rega")
                .resizable().aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)

            Text("Become a member!")
                .font(.title)
                .fontWeight(.bold)


            SCTextField(mainColor: .gray.opacity(0.3), secondaryColor: .gray.opacity(0.1), text: .constant(String()), placeholder: "Your name", cornerWidth: 1)
            SCTextField(mainColor: .gray.opacity(0.3), secondaryColor: .gray.opacity(0.1), text: .constant(String()), placeholder: "E-mail address", cornerWidth: 1)
            SCTextField(mainColor: .gray.opacity(0.3), secondaryColor: .gray.opacity(0.1), text: .constant(String()), placeholder: "Password", cornerWidth: 1, isSecure: true)

            SCDivider(label: "or")
                .padding(.horizontal, -100)

            HStack(spacing: 16) {
                Spacer()
                smallButton(image: "facebook")
                smallButton(image: "google")
                smallButton(image: "apple")
                Spacer()
            }

            SCButton(mainColor: .white, secondaryColor: .accentColor, text: buttonText, rightImage: Image(systemName: "arrow.right")) {
                presentationMode.wrappedValue.dismiss()
            }

            (Text("Already have and account?") + Text(" ") + Text("Sign in.").foregroundColor(.blue))
                .font(.caption)
                .fontWeight(.medium)

        }
        .padding(.horizontal, 32)
        .toolbar(.hidden, for: .tabBar)
    }

    private var buttonText: Text {
        Text("Create an account")
            .fontWeight(.bold)
    }

    private func smallButton(image: String) -> some View {
        ZStack {
            Color.gray.opacity(0.1)
            Image(image)
                .resizable()
                .scaledToFit()
                .padding(18)
        }
        .frame(width: 54, height: 54)
        .cornerRadiusWithBorder(borderColor: .gray.opacity(0.3), radius: .medium)
    }
}

#Preview {
    RegistrationView()
}
