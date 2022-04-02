//
//  StoriesListView.swift
//  Instragram
//
//  Created by Wind Versi on 2/4/22.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID().uuidString
    var username: String
    var userImageName: String?
    var hasStory: Bool
}

struct StoriesListView: View {
    // MARK: - Properties
    var hasDivider = true
    var currentUser = User(
        username: "username",
        userImageName: nil,
        hasStory: false
    )
    var followedUsers = [
        User(
            username: "username",
            userImageName: nil,
            hasStory: true
        ),
        User(
            username: "username",
            userImageName: nil,
            hasStory: true
        ),
        User(
            username: "username",
            userImageName: nil,
            hasStory: true
        ),
        User(
            username: "username",
            userImageName: nil,
            hasStory: true
        ),
        User(
            username: "username",
            userImageName: nil,
            hasStory: true
        ),
        User(
            username: "username",
            userImageName: nil,
            hasStory: true
        )
    ]

    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            
            // Row 1: Content
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    
                    // Current User Story
                    ProfileWithTitleView(
                        isNewStory: true,
                        action: {}
                    )
                    
                    // Followed Users Stories
                    ForEach(followedUsers) { user in
                        ProfileWithTitleView(
                            isNewStory: false,
                            title: user.username,
                            action: {}
                        )
                    }
                    
                } //: HStack
                
            } //: ScrollView
            .frame(maxWidth: .infinity)
            .frame(height: 113) // set a default height
            
            // Row 2: Divider
            DividerView()
        }
    }
    
}


struct StoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesListView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
