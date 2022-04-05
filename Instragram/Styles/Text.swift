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

enum TextStyle {
    case header
    case title
    case subtitle
    case subtitle2
}

extension Text {
    
    func textStyle(
        size: CGFloat = 15,
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
    
    func textStyle(
        _ textStyle: TextStyle,
        size: CGFloat? = nil,
        font: Fonts? = nil,
        letterSpacing: CGFloat? = nil,
        color: Color? = nil,
        colorOpacity: Double? = nil
    ) -> Text {
        switch textStyle {
        case .header:
            return self.textStyle(
                size: size ?? 23,
                font: font ?? .helveticaBold,
                letterSpacing: letterSpacing ?? -0.15,
                color: color ?? Colors.primary.value,
                colorOpacity: colorOpacity ?? 1
            )
        case .title:
            return self.textStyle(
                size: size ?? 15,
                font: font ?? .helveticaBold,
                letterSpacing: letterSpacing ?? -0.15,
                color: color ?? Colors.primary.value,
                colorOpacity: colorOpacity ?? 1
            )
        case .subtitle:
            return self.textStyle(
                size: size ?? 12,
                font: font ?? .helvetica,
                letterSpacing: letterSpacing ?? 0.4,
                color: color ?? Colors.primary.value,
                colorOpacity: colorOpacity ?? 1
            )
        case .subtitle2:
            return self.textStyle(
                size: size ?? 14,
                font: font ?? .helvetica,
                letterSpacing: letterSpacing ?? 0.4,
                color: color ?? Colors.primary.value,
                colorOpacity: colorOpacity ?? 1
            )
        }
    }
}
