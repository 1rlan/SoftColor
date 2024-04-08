//
//  InfoView.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColor

struct InfoView: View {
    private let columns = [GridItem(.flexible(), alignment: .topLeading)]
    private let guidelines: [Guideline] = [
        ColorsGuideline(),
        TypographyGuideline(),
        SpacingsGuideline(),
    ]

    var body: some View {
        NavigationView {
            VStack {
                Header(title: "SoftColor Information")

                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: SCSpacing.medium) {
                        ForEach(guidelines, id: \.id) { guideline in
                            NavigationLink {
                                GuidelinePage(guideline: guideline)
                            } label: {
                                SCVerticalCardView(
                                    mainColor: .white,
                                    secondaryColor: .black,
                                    image: Image(guideline.imageName),
                                    title: guideline.name,
                                    subtitle: ""
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

#Preview {
    InfoView()
        .previewInterfaceOrientation(.portrait)
}
