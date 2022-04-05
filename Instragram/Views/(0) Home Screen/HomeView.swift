//
//  HomeView.swift
//  Instragram
//
//  Created by Wind Versi on 1/4/22.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @Binding var selectedTabItem: TabItem
    @State private var yOffset: CGFloat? = nil
    @State private var topBarDividerOpacity = 0.0
    @State private var storyHeightMaxY = 113.5
    
    var posts = [
        Post(),
        Post(),
        Post()
    ]

    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            
            // Row 1: Top Bar
            TopBarView(
                topBarType: .home,
                dividerOpacity: topBarDividerOpacity
            )

            // Row 2: Content
            ScrollViewOffset(
                showIndicators: false,
                onOffsetChange: onOffsetChange
            ) {
                // Stories
                StoriesListView(hasDivider: true)

                // Posts
                VStack(spacing: 5) {
                    ForEach(posts) {
                        PostView(post: $0)
                    }
                }
                .fillMaxSize()
            }
            
        } //: VStack
    }
    
    // MARK: - Function
    func onOffsetChange(y: CGFloat) {
        yOffset = y
        guard let yOffset = yOffset else {
            return
        }
        if yOffset >= -storyHeightMaxY {
            topBarDividerOpacity = 1 - (storyHeightMaxY+yOffset)/storyHeightMaxY
        }
    }
    
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedTabItem: .constant(.home))
    }
}
