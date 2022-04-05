//
//  TopBarView.swift
//  Instragram
//
//  Created by Wind Versi on 1/4/22.
//

import SwiftUI

enum TopBarType {
    case home
    case profile
    case search
    case shop
    case reels
}

struct IconView: View {
    // MARK: - Properties
    var imageName: String
    var size: (width: CGFloat, height: CGFloat)
    var color = Color("Primary")
    
    // MARK: - Body
    var body: some View {
        Image(imageName)
            .resizable()
            .renderingMode(.template)
            .scaledToFit()
            .foregroundColor(color)
            .frame(width: size.width, height: size.height)
    }
}

struct IconButtonView: View {
    // MARK: - Properties
    var imageName: String
    var buttonSize: (width: CGFloat, height: CGFloat)
    var iconSize: (width: CGFloat, height: CGFloat)? = nil
    var iconColor = Color("Primary")
    var backgroundColor: Color? = nil
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            IconView(
                imageName: imageName,
                size: (
                    iconSize != nil ? iconSize!.width : buttonSize.width,
                    iconSize != nil ? iconSize!.height : buttonSize.height
                ),
                color: iconColor
            )
        }
        .frame(width: buttonSize.width, height: buttonSize.height)
        .background(backgroundColor)
    }
}



struct TopBarView: View {
    // MARK: - Properties
    var topBarType: TopBarType
    var dividerOpacity = 1.0
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Row 1: Content
            HStack(spacing: 15) {
                if topBarType == .home {
                    // Col 1: Instagram Logo
                    IconButtonView(
                        imageName: "instagramLogo",
                        buttonSize: (116, 33),
                        action: {}
                    )
                    
                    Spacer()
                    
                    // Col 2: New Post
                    IconButtonView(
                        imageName: "addIcon",
                        buttonSize: (28, 28),
                        action: {}
                    )
                    
                    // Col 3: Likes
                    IconButtonView(
                        imageName: "likeIcon",
                        buttonSize: (28, 28),
                        action: {}
                    )
                    
                    // Col 4: Messages
                    IconButtonView(
                        imageName: "messageIcon",
                        buttonSize: (28, 28),
                        action: {}
                    )
                    
                } else if topBarType == .search {
                    // Col 1: Search Bar
                    
                    // Col 2: Locations
                    
                   
                } else if topBarType == .reels {
                    // Col 1: Title
                    
                    // Col 2: Camera
                                    
                    
                } else if topBarType == .shop {
                    // Col 1: Title
                    
                    // Col 2: Saved Pages
                    
                    // Col 3: More
                    
                    
                } else {
                    // Col 1: Title
                    
                    // Col 2: New Post
                    
                    // Col 3: More
                }
            }
            .fillMaxWidth()
            .frame(height: topBarType == .home ? 47 : 50)
            .padding(.leading, 19)
            .padding(.trailing, 15)
            
            // MARK: - Row 2: Divider
            DividerView(opacity: dividerOpacity)
            
        } //: VStack
    }
}

// MARK: - Preview
struct TopBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarView(topBarType: .home)
            .previewLayout(.sizeThatFits)
    }
}
