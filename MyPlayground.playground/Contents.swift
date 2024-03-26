import SwiftUI

enum Luminance {
    static func `for`(color: Color) -> Double {
        let rawComponents = color.rgba.map { rawValue in
          return rawValue <= 0.03928
              ? rawValue / 12.92
              : pow((rawValue + 0.055) / 1.055, 2.4)
        }
        return rawComponents[0] * 0.2126 + rawComponents[1] * 0.7152 + rawComponents[2] * 0.0722
    }

    static func ratio(firstColor: Color, secondColor: Color) -> Double {
        let firstColorLuminance = Luminance.for(color: firstColor)
        let secondColorLuminance = Luminance.for(color: secondColor)

        let lighterLum = max(firstColorLuminance, secondColorLuminance);
        let darkerLum = min(firstColorLuminance, secondColorLuminance);

        return (lighterLum + 0.05) / (darkerLum + 0.05)
    }
}


extension Color {
    var rgba: [CGFloat] {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return [red, green, blue]
    }
}

print(Luminance.ratio(firstColor: .black, secondColor: .mint))
//print(Color.white.hsba)
//print(Color.blue.hsba)
//print(Color.red.hsba)
//print(Color.black.hsba)
//print(Color.gray.hsba)
