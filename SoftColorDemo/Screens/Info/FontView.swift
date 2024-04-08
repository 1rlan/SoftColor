//
//  FontView.swift
//  SoftColorDemo
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI
import SoftColor

struct FontView: View {
    let fontStyles = Array(SCFontStyle.allCases)

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(fontStyles, id: \.hashValue) { fontStyle in
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(fontStyle.description)")
                        .scFont(fontStyle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("style: \(fontStyle.rawValue)").font(.system(.caption, design: .monospaced))
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}
