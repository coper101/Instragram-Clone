//
//  HomeView.swift
//  Instragram
//
//  Created by Wind Versi on 1/4/22.
//

import SwiftUI

private struct OffsetPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

struct ScrollViewOffset<Content: View>: View {
    // MARK: - Properties
    let axis: Axis.Set
    let showIndicators: Bool
    let content: () -> Content
    let onOffsetChange: (CGFloat) -> Void
    
    init(
        axis: Axis.Set = .vertical,
        showIndicators: Bool = true,
        onOffsetChange: @escaping (CGFloat) -> Void = {_ in},
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.axis = axis
        self.showIndicators = showIndicators
        self.content = content
        self.onOffsetChange = onOffsetChange
    }
    
    // MARK: - Body
    var body: some View {
        ScrollView(
            axis,
            showsIndicators: showIndicators
        ) {
            offsetReader
            // negative padding move to top to remove space of offsetReader
            content().padding(.top, -8)
        }
            .coordinateSpace(name: "frameLayer")
            .onPreferenceChange(OffsetPreferenceKey.self, perform: onOffsetChange)
    }
    
    var offsetReader: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(
                    key: OffsetPreferenceKey.self,
                    value: proxy.frame(in: .named("frameLayer")).minY
                )
        }
        .frame(height: 0)
    }
    
}

struct Post: Identifiable {
    let id = UUID().uuidString
    var imageName: String? = "stetch"
    var user: User = User()
}


struct HomeView: View {
    // MARK: - Properties
    @State private var selectedTabItem = TabItem.home
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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            // Row 3: Tab Bar
            TabBarView(selectedTabItem: $selectedTabItem)
        }
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
        HomeView()
    }
}
