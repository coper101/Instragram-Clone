//
//  DividerView.swift
//  Instragram
//
//  Created by Wind Versi on 1/4/22.
//

import SwiftUI

struct DividerView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        Rectangle()
            .fill(Color("Surface"))
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
