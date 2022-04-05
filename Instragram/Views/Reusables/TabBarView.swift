//
//  TabBarView.swift
//  Instragram
//
//  Created by Wind Versi on 30/3/22.
//

import SwiftUI

enum TabItem: Int {
    case home = 1
    case search = 2
    case reels = 3
    case shop = 4
    case profile = 5
}

struct TabButtonItem: Identifiable {
    var iconName: String? = nil
    var iconNameActive: String? = nil
    var tabItem: TabItem
    var id: String {
        "\(tabItem.rawValue)"
    }
}

struct TabButtonView: View {
    // MARK: - Properties
    @State var isPressed = false
    
    var tabButtonItem: TabButtonItem
    @Binding var selectedTabItem: TabItem
    var isActive: Bool {
        selectedTabItem == tabButtonItem.tabItem
    }
    var length: CGFloat = 28
    
    // MARK: - Body
    var body: some View {
        Button(action: didTapButton) {
            if tabButtonItem.tabItem == .profile {
                Circle()
                    .fill(Color("Surface2"))
                    .frame(width: length, height: length)
                    .overlay(
                        Circle()
                            .stroke(
                                Color("Primary"),
                                lineWidth: isActive || isPressed ? 0.8 : 0
                            )
                    )
            } else {
                Image(isActive || isPressed ?
                        tabButtonItem.iconNameActive! :
                        tabButtonItem.iconName!
                )
                    .resizable()
                    .frame(width: length, height: length)
                    .foregroundColor(Color("Primary"))
            }
        }
        .buttonStyle(MyButtonStyle(isPressed: $isPressed))
        .fillMaxSize()
    }
    
    // MARK: - Functions
    func didTapButton() {
        selectedTabItem = tabButtonItem.tabItem
    }
}

struct TabBarView: View {
    // MARK: - Properties
    @Binding var selectedTabItem: TabItem
    var tabItems = [
        TabButtonItem(
            iconName: "homeOutlined",
            iconNameActive: "homeFilled",
            tabItem: .home
        ),
        TabButtonItem(
            iconName: "searchOutlined",
            iconNameActive: "searchFilled",
            tabItem: .search
        ),
        TabButtonItem(
            iconName: "reelsOutlined",
            iconNameActive: "reelsFilled",
            tabItem: .reels
        ),
        TabButtonItem(
            iconName: "shopOutlined",
            iconNameActive: "shopFilled",
            tabItem: .shop
        ),
        TabButtonItem(
            tabItem: .profile
        )
    ]
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            
            // Row 1:
            DividerView()
            
            // Row 2:
            HStack(spacing: 0) {
                ForEach(tabItems) { item in
                    TabButtonView(
                        tabButtonItem: item,
                        selectedTabItem: $selectedTabItem
                    )
                }
            } //: HStack
            .frame(height: 49)
            .fillMaxWidth()
            
        } //: VStack
    }
       
}

struct MyButtonStyle: ButtonStyle {
    @Binding var isPressed: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .onChange(of: configuration.isPressed) {
                isPressed = $0
            }
    }
}

// MARK: - Preview
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTabItem: .constant(.home))
            .previewLayout(.sizeThatFits)
    }
}
