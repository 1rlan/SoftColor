//
//  SCSegmentedPicker.swift
//
//  Created by Irlan Abushakhmanov
//

import SwiftUI
import SoftColorAnalyzer

public struct SCSegmentedPicker<Segment, Selection>: View, BiColorAnalyzer where Segment: View, Selection: Hashable {
    @Binding private var selection: Selection

    public let mainColor: Color
    public let secondaryColor: Color

    private let tags: [Selection]
    private let segments: [Segment]
    private let lineWidth: CGFloat
    private var selectionIndex: Int {
        tags.firstIndex(of: selection) ?? 0
    }

    public init(
        mainColor: Color,
        secondaryColor: Color,
        selection: Binding<Selection>, 
        tags: [Selection],
        lineWidth: CGFloat = 1,
        @ArrayBuilder<Segment> content: () -> [Segment]
    ) {
        self.mainColor = mainColor
        self.secondaryColor = secondaryColor
        self._selection = selection
        self.lineWidth = lineWidth
        self.tags = tags
        self.segments = content()
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(secondaryColor)
                    .saturation(1)
                    .cornerRadius(20)
                    .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: lineWidth)
                )

                Rectangle()
                    .fill(mainColor)
                    .frame(width: self.segmentWidth(parentWidth: geometry.size.width))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.black, lineWidth: lineWidth)
                    )
                    .offset(x: self.segmentWidth(parentWidth: geometry.size.width) * CGFloat(self.selectionIndex))

                HStack(spacing: 0) {
                    ForEach(0..<self.segments.count, id:\.self) { index in
                        Button(action: {
                            withAnimation {
                                self.selection = self.tags[index]
                            }
                        }) {
                            HStack(spacing: 0) {
                                Spacer()
                                self.segments[index]
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.1)
                                Spacer()
                            }
                        }
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                        .frame(width: self.segmentWidth(parentWidth: geometry.size.width), height: 40)
                    }
                }
            }
            .highPriorityGesture(DragGesture()
                .onChanged { gesture in
                    withAnimation {
                        self.selection = self.segment(for: gesture.location.x, in: geometry.size.width)
                    }
                }
            )
        }
        .padding(1)
        .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
        .cornerRadius(20)
        .onAppear {
            analyze()
        }
    }

    private func segment(for xPosition: CGFloat, in parentWidth: CGFloat) -> Selection {
        var index = min(Int(xPosition / segmentWidth(parentWidth: parentWidth)), segments.count - 1)
        index = max(0, min(index, segments.count - 1))
        return tags[index]
    }

    private func segmentWidth(parentWidth: CGFloat) -> CGFloat {
        return parentWidth / CGFloat(self.segments.count)
    }
}

public var SCSegmentedPickerPV: some View {
    VStack(spacing: 32) {
        PreviewContainer(text: "Picker with two tabs:") {
            SCSegmentedPicker(
                mainColor: .white,
                secondaryColor: .gray,
                selection: .constant(0),
                tags: [0, 1],
                lineWidth: 1.7
            ) {
                Text("First Tab")
                Text("Second Tab")
            }
        }

        PreviewContainer(text: "Picker with three tabs:") {
            SCSegmentedPicker(
                mainColor: .white,
                secondaryColor: .white,
                selection: .constant(1),
                tags: [0, 1, 2],
                lineWidth: 0.3
            ) {
                Text("Раз")
                Text("Два")
                Text("Три")
            }
        }

        PreviewContainer(text: "Picker and lot of tabs...:") {
            SCSegmentedPicker(
                mainColor: .white,
                secondaryColor: .blue,
                selection: .constant(3),
                tags: [0, 1, 2, 3, 4],
                lineWidth: 0.9
            ) {
                Text("Раз")
                Text("Два")
                Text("Три")
                Text("4")
                Text("Пять")
            }
        }
    }
    .padding(16)
}

#Preview {
    SCSegmentedPickerPV
}
