//
//  ColorView.swift
//  SoftColorDemo
//
//  Created by Irlan Abushakhmanov 
//

import SwiftUI
import SoftColor
import SoftColorAnalyzer

struct ColorView: View {
    @State var selected: Int = 0
    private let colors: [Color] = [.red, .yellow, .indigo, .pink, .orange, .purple, .secondary]
    private let colorPairs: [(Color, Color)] = [
        (.black, .red), (.yellow, .blue), (.pink, .indigo), (.gray, .pink),
        (.mint, .yellow), (.orange, .brown), (.secondary, .purple)
    ]

    var body: some View {
        VStack(spacing: 16) {
            SCSegmentedPicker(
                mainColor: .white,
                secondaryColor: .accentColor,
                selection: $selected,
                tags: [0, 1]) {
                    Text("One color")
                    Text("Two colors")
                }


            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    if selected == 1 {
                        ForEach(colorPairs, id: \.0.hashValue) { color in
                            twoColorsContainter(color.0, color.1)
                            SCDivider()
                                .padding(.horizontal, -16)
                        }

                    } else {
                        ForEach(colors, id: \.hashValue) { color in
                            oneColorContainter(color)
                            SCDivider()
                                .padding(.vertical, 16)
                                .padding(.horizontal, -16)
                        }
                    }
                }
            }
        }
        .padding(16)
    }

    private func twoColorsContainter(_ color1: Color, _ color2: Color) -> some View {
        VStack {
            VStack(spacing: 16) {
                HStack {
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundColor(color1)
                        .aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)

                    RoundedRectangle(cornerRadius: 24)
                        .foregroundColor(color2)
                }

                let val = check(firstColor: color1, secondColor: color2)


                (Text("Colors ratio is ") + Text("\(val)")
                    .fontWeight(.semibold))

            }
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(.white)
    }

    private func oneColorContainter(_ color: Color) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 24)
                .foregroundColor(color)
                .frame(width: 120, height: 120)

            Spacer()

            let value = color.hsba
            (Text("Saturation is ") + Text("\(value.saturation)").fontWeight(.semibold))
        }
        .frame(maxWidth: .infinity)
        .background(.white)
    }
}

private func check(firstColor: Color, secondColor: Color) -> Double {
    let firstColorGradeShade = firstColor.gradeShade
    let secondColorGradeShade = secondColor.gradeShade

    let ratio = firstColorGradeShade > secondColorGradeShade
        ? ((secondColorGradeShade + 0.05) / (firstColorGradeShade + 0.05))
        : ((firstColorGradeShade + 0.05) / (secondColorGradeShade + 0.05))
    
    return 1 / ratio
}

#Preview {
    ColorView()
}
