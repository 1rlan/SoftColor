//
//  View.swift
//  SoftColorDemo
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI
import SoftColor

struct SoftColorView: View {
    private let columns = [GridItem(.flexible(), alignment: .topLeading)]
    private let scViews: [SCViewProtocol] = [
        SCHorizontalCardVP(),
        SCVerticalCardVP(),
        SCStatusVP(),
        SCTabBarVP(),
        SCBannerVP(),
        SCButtonVP(),
        SCSegmentedPickerVP(),
        SCSliderVP(),
        SCSpinnerVP(),
        SCTextFieldVP(),
        SCToggleVP(),
        SCDividerVP()
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Header(title: "SoftColor Views")

                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(scViews, id: \.name) { model in
                        NavigationLink {
                            VStack {
                                model.view
                                Spacer()
                            }
                            .navigationBarTitleDisplayMode(.inline)

                        } label: {
                            label(string: model.name)
                                .padding(.horizontal, 16)
                                .padding(.top, 2)
                        }
                        .accentColor(.black)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
        }
    }

    private func label(string: String) -> some View {
        HStack {
            Text(string)
                .fontWeight(.light)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: .gray, radius: 2, x: 1, y: 1)
        )
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}

#Preview {
    SoftColorView()
}
