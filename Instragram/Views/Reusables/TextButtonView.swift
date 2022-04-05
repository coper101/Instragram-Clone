//
//  TextButtonView.swift
//  Instragram
//
//  Created by Wind Versi on 5/4/22.
//

import SwiftUI

struct TextButtonView: View {
    // MARK: - Properties
    var title: String
    var action: () -> Void = {}
    var size: CGFloat = 16
    var font: Fonts = .helvetica
    var letterSpacing: CGFloat = -0.15
    var color: Color = Colors.primary.value
    var colorOpacity: Double = 1
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Text(title)
                .textStyle(
                    size: size,
                    font: font,
                    letterSpacing: letterSpacing,
                    color: color,
                    colorOpacity: colorOpacity
                )
        }
    }
}

// MARK: - Preview
struct TextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TextButtonView(title: "Title")
    }
}
