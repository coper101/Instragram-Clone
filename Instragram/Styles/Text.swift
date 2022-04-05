//
//  Styles.swift
//  Instragram
//
//  Created by Wind Versi on 5/4/22.
//

import SwiftUI

enum Fonts: String {
    case helveticaBold = "Helvetica-Bold"
    case helvetica = "Helvetica"
}

enum Colors: String {
    case primary = "Primary"
    var value: Color {
        Color(self.rawValue)
    }
}

extension Text {
    func textStyle(
        size: CGFloat = 16,
        font: Fonts = .helvetica,
        letterSpacing: CGFloat = -0.15,
        color: Color = Colors.primary.value,
        colorOpacity: Double = 1
    ) -> Text {
        self
            .font(.custom(font.rawValue, size: size))
            .kerning(letterSpacing)
            .foregroundColor(color.opacity(colorOpacity))
    }
}
