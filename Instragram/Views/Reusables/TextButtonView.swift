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
    var textStyle: TextStyle = .subtitle
    var size: CGFloat? = nil
    var font: Fonts? = nil
    var letterSpacing: CGFloat? = nil
    var color: Color? = nil
    var colorOpacity: Double? = nil
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Text(title)
                .textStyle(
                    textStyle,
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
        TextButtonView(title: "Title", textStyle: .title)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
