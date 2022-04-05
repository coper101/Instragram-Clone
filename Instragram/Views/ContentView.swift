//
//  ContentView.swift
//  Instragram
//
//  Created by Wind Versi on 27/3/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var selectedTabItem = TabItem.home

    // MARK: - Body
    var body: some View {
        TabNavigationView(selectedTabItem: $selectedTabItem) {
            switch selectedTabItem {
            case .home:
                HomeView(selectedTabItem: $selectedTabItem)
            case .search:
                SearchView()
            case .reels:
                ReelsView()
            case .shop:
                ShopView()
            case .profile:
                MyProfileView()
            }
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
