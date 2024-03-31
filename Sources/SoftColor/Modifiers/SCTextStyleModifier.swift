//
//  SCTextStyleModifier.swift
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI

public extension Text {
    func settingsTitle() -> some View {
        self.font(.system(.title3).weight(.semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func tabTitle() -> some View {
        self.font(.system(.title3).weight(.semibold))
            .frame(height: 50, alignment: .center)
    }
}
