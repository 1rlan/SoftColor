//
//  Header.swift
//  SoftColorDemo
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColorAnalyzer

struct Header: View {
    let title: String

    var body: some View {
        VStack {
            Text(title).tabTitle()
            Divider()
        }
    }
}

#Preview {
    Header(title: "This is title")
}
