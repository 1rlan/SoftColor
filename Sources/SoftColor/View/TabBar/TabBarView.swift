//
//  StatusBarState.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColorAnalyzer

public struct TabBar<TabBarState>: View, BiColorAnalyzer where TabBarState: TabBarModel {
    @Binding var selectedTab: TabBarState
    @Binding var title: String
    public let mainColor: Color
    public let secondaryColor: Color

    private var image: String {
        selectedTab.imageName
    }

    public init(selectedTab: Binding<TabBarState>, title: Binding<String>, mainColor: Color, secondaryColor: Color) {
        self._selectedTab = selectedTab
        self._title = title
        self.mainColor = mainColor
        self.secondaryColor = secondaryColor
    }

    @ViewBuilder
    public var body: some View {
        HStack {
            ForEach(Array(TabBarState.allCases), id: \.imageName) { tab in
                Spacer()
                Image(systemName: tab == selectedTab ? tab.chosenImageName : tab.imageName)
                    .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                    .foregroundColor(tab == selectedTab ? mainColor : .gray)
                    .font(.system(size: 20))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            tapAction(newSelection: tab)
                        }
                    }
                Spacer()
            }
        }
        .frame(height: 60)
        .background(secondaryColor)
        .cornerRadius(30)
        .shadow(color: .gray, radius: 1, x: 0, y: 1)
        .onAppear {
            analyze()
        }
    }
    
    private func tapAction(newSelection: TabBarState) {
        selectedTab = newSelection
        title = newSelection.tabString
    }
}

public var TabBarPV: some View {
    VStack {
        PreviewContainer(text: "Обычный таббар с 4 элементами") {
            TabBar<TabBarState>(
                selectedTab: .constant(.settings),
                title: .constant(.empty),
                mainColor: .accentColor,
                secondaryColor: .white
            )
        }
        .padding()

        PreviewContainer(text: "Тоже обычный таббар с 3 элементами") {
            TabBar<TabBarState2>(
                selectedTab: .constant(.folder),
                title: .constant(.empty),
                mainColor: .orange,
                secondaryColor: .white
            )
        }
        .padding()
    }
}

#Preview {
    TabBarPV
}
