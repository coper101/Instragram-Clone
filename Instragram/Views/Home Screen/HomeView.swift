//
//  HomeView.swift
//  Instragram
//
//  Created by Wind Versi on 1/4/22.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @State private var selectedTabItem = TabItem.home
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            // Row 1: Top Bar
            TopBarView(topBarType: .home, hasDivider: false)
            
            // Row 2: Content
            ScrollView {
                StoriesListView(hasDivider: true)

                VStack {
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            // Row 3: Tab Bar
            TabBarView(selectedTabItem: $selectedTabItem)
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
