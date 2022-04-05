//
//  TabNavigationView.swift
//  Instragram
//
//  Created by Wind Versi on 5/4/22.
//

import SwiftUI

struct TabNavigationView<Content: View>: View {
    // MARK: - Properties
    @Binding var selectedTabItem: TabItem
    let content: () -> Content

    init(
        selectedTabItem: Binding<TabItem>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self._selectedTabItem = selectedTabItem
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            // Row 1:
            content()
            // Row 2:
            TabBarView(selectedTabItem: $selectedTabItem)
        }
    }
}

// MARK: - Preview
struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView(selectedTabItem: .constant(.home)) {
            VStack() {}.frame(height: 400)
        }
            .previewLayout(.sizeThatFits)
    }
}
