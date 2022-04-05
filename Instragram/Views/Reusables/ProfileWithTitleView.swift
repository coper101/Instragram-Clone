//
//  ProfileWithTitleView.swift
//  Instragram
//
//  Created by Wind Versi on 2/4/22.
//

import SwiftUI

struct NewStoryView: View {
    // MARK: - Properties
    var addCircleLength: CGFloat = 28
    var addCircleSmallLength: CGFloat = 21
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            ZStack(alignment: .bottomTrailing) {
                
                // Layer 1:
                NewStoryShape(addCircleLength: addCircleLength)
                    .fill(
                        Color("Surface"),
                        style: FillStyle(eoFill: true, antialiased: true)
                    )
                    .clipShape(Circle())
                    .fillMaxSize()
                
                // Layer 2:
                ZStack {
                    VStack(spacing: 0) {
                        IconView(
                            imageName: "plusIcon",
                            size: (12, 12),
                            color: .white
                        )
                    }
                    .frame(
                        width: addCircleSmallLength,
                        height: addCircleSmallLength
                    )
                    .background(.blue)
                    .clipShape(Circle())
                }
                    .frame(
                        width: addCircleLength,
                        height: addCircleLength
                    )
                
            }
            .frame(width: 65, height: 64)
            
        } //: Button
        .buttonStyle(ButtonScaleStyle())
    }
}

struct NewStoryShape: Shape {
    var addCircleLength: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addEllipse(
            in: CGRect(
                x: rect.minX,
                y: rect.minY,
                width: rect.maxX,
                height: rect.maxY
            )
        )
        
        path.addEllipse(
            in: CGRect(
                x: rect.maxX - addCircleLength,
                y: rect.maxY - addCircleLength,
                width: addCircleLength,
                height: addCircleLength
            )
        )
        return path
    }
}


struct ProfileWithTitleView: View {
    // MARK: - Properties
    var isNewStory = true
    var title = "Your Story"
    var action: () -> Void
    var imageName: String? = nil
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {

            // Row 1: Profile
            if isNewStory {
                NewStoryView(action: action)
                    .padding(.top, 5)
            } else {
                ProfileView(
                    imageName: imageName,
                    hasStory: true,
                    action: action
                )
            }
            Spacer()
            
            // Row 2: Title
            Text(title)
                .textStyle(.subtitle)
                .fillMaxWidth()
                .padding(.bottom, 5)
            
        } //: VStack
        .frame(width: 87, height: 105)
    }
}

// MARK: - Preview
struct ProfileWithTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileWithTitleView(action: {})
            .previewDisplayName("Profile - New Story")
            .previewLayout(.sizeThatFits)
            .padding()
        
        ProfileWithTitleView(
            isNewStory: false,
            title: "username",
            action: {}
        )
            .previewDisplayName("Profile - Has Story")
            .previewLayout(.sizeThatFits)
            .padding()
        
        NewStoryView(action: {})
            .previewDisplayName("New Story Shape")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
