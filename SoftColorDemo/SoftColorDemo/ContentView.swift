//
//  ContentView.swift
//  SoftColorDemo
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI
import SoftColor

struct ContentView: View {
    @ViewBuilder
    var body: some View {
        TabView {
            InfoView()
                .tabItem {
                    Label("Identity", systemImage: "bold.italic.underline")
                }
            SoftColorView()
                .tabItem {
                    Label("Elements", systemImage: "book.pages.fill")
                }
            FlowView()
                .tabItem {
                    Label("Flows", systemImage: "rectangle.inset.filled.and.person.filled")
            }
        }
    }
}

#Preview {
    ContentView()
        .previewInterfaceOrientation(.portrait)
}
