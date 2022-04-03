//
//  DividerView.swift
//  Instragram
//
//  Created by Wind Versi on 1/4/22.
//

import SwiftUI

struct DividerView: View {
    // MARK: - Properties
    var opacity = 1.0
    
    // MARK: - Body
    var body: some View {
        Rectangle()
            .fill(Color("Surface").opacity(opacity))
            .frame(height: 0.5)
            .frame(maxWidth: .infinity)
    }
}

// MARK: - Preview
struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
