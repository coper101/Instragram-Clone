//
//  TabBarView.swift
//  Instragram
//
//  Created by Wind Versi on 30/3/22.
//

import SwiftUI

struct TabButtonView: View {
    var iconName: String
    var iconNameActive: String
    var index: Int
    @Binding var isActiveIndex: Int
    var isActive: Bool {
        isActiveIndex == index
    }
    
    var body: some View {
        Button(action: { isActiveIndex = index }) {
            Image(isActive ? iconNameActive : iconName)
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundColor(Color("Primary"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct TabBarView: View {
    // MARK: - Properties
    @State var isActiveIndex = 0
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 0) {
            TabButtonView(
                iconName: "homeOutlined",
                iconNameActive: "homeFilled",
                index: 0,
                isActiveIndex: $isActiveIndex
            )
            TabButtonView(
                iconName: "searchOutlined",
                iconNameActive: "searchFilled",
                index: 1,
                isActiveIndex: $isActiveIndex
            )
            TabButtonView(
                iconName: "reelsOutlined",
                iconNameActive: "reelsFilled",
                index: 2,
                isActiveIndex: $isActiveIndex
            )
            TabButtonView(
                iconName: "shopOutlined",
                iconNameActive: "shopFilled",
                index: 3,
                isActiveIndex: $isActiveIndex
            )
            Button(action: { isActiveIndex = 4 }) {
                Circle()
                    .fill(Color("Surface2"))
                    .frame(width: 28, height: 28)
                    .overlay(
                        Circle()
                            .stroke(
                                Color("Primary"),
                                lineWidth: isActiveIndex == 4 ? 0.8 : 0
                            )
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .frame(height: 49)
        .frame(maxWidth: .infinity)
    }
       
}

// MARK: - Preview
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .previewLayout(.sizeThatFits)
    }
}
