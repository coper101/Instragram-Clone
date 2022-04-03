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
            
            // Row 1: Post Top Bar
            VStack(spacing: 0) {
                
                // Row 1: Content
                HStack(spacing: 7) {
                    ProfileView(
                        imageName: nil,
                        hasStory: true,
                        size: .small,
                        action: {}
                    )
                    Text(post.user.username)
                        .font(.custom("Helvetica-Bold", size: 15))
                        .kerning(-0.15)
                    Spacer()
                }
                .frame(height: 54)
                .frame(maxWidth: .infinity)
                .padding(.leading, 12)
                .padding(.trailing, 6)
                
                // Row 2: Divider
                DividerView()
            }
            
            // Row 2: Post Image
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
            .frame(maxWidth: .infinity)
            
            // Row 3: Post Bottom Bar
            HStack(spacing: 5) {
                IconButtonView(
                    imageName: "likeIcon",
                    buttonSize: (28, 28),
                    action: {}
                )
                IconButtonView(
                    imageName: "commentIcon",
                    buttonSize: (28, 28),
                    action: {}
                )
                IconButtonView(
                    imageName: "messageIcon",
                    buttonSize: (28, 28),
                    action: {}
                )
                Spacer()
            }
        }
    }
    
}


struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(
            imageName: "stetch",
            user: User(
                username: "username",
               hasStory: false
            )
       ))
            .previewLayout(.sizeThatFits)
    }
}
