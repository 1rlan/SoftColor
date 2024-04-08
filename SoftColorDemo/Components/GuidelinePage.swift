//
//  GuidelinePage.swift
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI

struct GuidelinePage: View {
    let guideline: Guideline

    var body: some View {
        List {
            VStack(alignment: .leading) {
                Image(guideline.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.bottom, 8)

                Text(guideline.description)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(Visibility.hidden)
            .padding(.horizontal, 0)

            guideline.pageDescription
                .listRowInsets(EdgeInsets())
                .listRowSeparator(Visibility.hidden)
        }
        .navigationTitle(guideline.name)
        .listStyle(.plain)
        .padding(.top, 0)
        .background(Color(UIColor.systemBackground))
    }
}
