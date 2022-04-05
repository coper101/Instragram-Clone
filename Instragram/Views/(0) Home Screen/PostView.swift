//
//  PostView.swift
//  Instragram
//
//  Created by Wind Versi on 3/4/22.
//

import SwiftUI

struct PostView: View {
    // MARK: - Properties
    var post: Post
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Row 1: Post Top Bar
            VStack(spacing: 0) {
                
                // Row 1: Content
                HStack(spacing: 7) {
                    
                    // Col 1: Profile Pic
                    ProfileView(
                        imageName: nil,
                        hasStory: true,
                        size: .small,
                        action: {}
                    )
                    
                    // Col 2: Username
                    TextButtonView(
                        title: "username",
                        action: {},
                        textStyle: .title
                    )
                    Spacer()
                                        
                    // Col 3: More Button
                    IconButtonView(
                        imageName: "moreIcon",
                        buttonSize: (28, 28),
                        action: {}
                    )
                }
                .frame(height: 54)
                .fillMaxWidth()
                .padding(.leading, 12)
                .padding(.trailing, 6)
                
                // Row 2: Divider
                DividerView()
            }
            
            // MARK: - Row 2: Post Image
            VStack {
                if let imageName = post.imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                } else {
                    Color("Surface")
                }
            }
            .frame(height: 376)
            .fillMaxWidth()
            
            // MARK: - Row 3: Post Bottom Bar
            VStack(spacing: 0) {
                HStack(spacing: 12) {
                    // Col 1: Like
                    IconButtonView(
                        imageName: "likeIcon",
                        buttonSize: (28, 28),
                        action: {}
                    )
                    // Col 2: Comment
                    IconButtonView(
                        imageName: "commentIcon",
                        buttonSize: (28, 28),
                        action: {}
                    )
                    // Col 3: Direct Message
                    IconButtonView(
                        imageName: "directMessageIcon",
                        buttonSize: (28, 28),
                        action: {}
                    )
                    Spacer()
                    // Col 4: Saved Post
                    IconButtonView(
                        imageName: "savedPostIcon",
                        buttonSize: (28, 28),
                        action: {}
                    )
                }
                .padding(.trailing, 16)
                .padding(.leading, 12)
                .padding(.vertical, 12)
                
                HStack(spacing: 5) {
                    // Col 1: Profile Pic
                    ProfileView(
                        imageName: nil,
                        hasStory: false,
                        size: .tiny,
                        action: {}
                    )
                        .padding(.trailing, 2)
                    // Col 2: Likes
                    Text("Liked by")
                    TextButtonView(
                        title: "username",
                        action: {},
                        textStyle: .title
                    )
                    Text("and")
                    TextButtonView(
                        title: "10,000 others",
                        action: {},
                        textStyle: .title
                    )
                    Spacer()
                }
                .padding(.trailing, 16)
                .padding(.leading, 15)
                
                HStack(spacing: 5) {
                    // Col 1: Username & Caption
                    TextButtonView(
                        title: "username",
                        action: {},
                        textStyle: .title
                    )
                    Text("caption...")
                    // Col 2: More Button
                    TextButtonView(
                        title: "more",
                        action: {},
                        textStyle: .title,
                        font: .helvetica,
                        colorOpacity: 0.5
                    )
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 7)

                VStack(alignment: .leading, spacing: 7) {
                    // Col 1: View All Comments Button
                    TextButtonView(
                        title: "View all 100 comments",
                        action: {},
                        textStyle: .title,
                        font: .helvetica,
                        colorOpacity: 0.5
                    )
                    // Col 2: Time Posted
                    Text("1 hour ago")
                        .textStyle(colorOpacity: 0.5)
                }
                .fillMaxWidth(alignment: .leading)
                .padding(.bottom, 10)
                .padding(.horizontal, 16)
            }

        }
    }
    
}


struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post())
            .previewLayout(.sizeThatFits)
    }
}
