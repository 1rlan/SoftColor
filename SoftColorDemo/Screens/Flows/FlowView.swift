//
//  FlowView.swift
//  SoftColorDemo
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColor

struct FlowView: View {
    private let columns = [GridItem(.flexible(), alignment: .topLeading)]
    private let guidelines: [Guideline] = [
        RegistrationGuideline(),
        MenuGuideline()
    ]

    var body: some View {
        NavigationView {
            VStack {
                Header(title: "Flows")

                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, alignment: .leading, spacing: SCSpacing.medium) {
                        ForEach(guidelines, id: \.id) { guideline in
                            NavigationLink {
                                guideline.pageDescription
                                    // .toolbar(.hidden, for: .bottomBar)
                                    .navigationBarHidden(true)
                            } label: {
                                SCVerticalCardView(
                                    mainColor: .white,
                                    secondaryColor: .accentColor,
                                    image: Image(guideline.imageName),
                                    title: guideline.name,
                                    subtitle: guideline.description
                                )
                            }
                            .accentColor(.black)
                        }

                    }
                }
                .padding(.horizontal, 16)
            }
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
