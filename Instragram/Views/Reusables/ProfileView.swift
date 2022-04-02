//
//  ProfileView.swift
//  Instragram
//
//  Created by Wind Versi on 29/3/22.
//

import SwiftUI

enum ProfileSize {
    case small
    case big
    
    var value: (width: CGFloat, height: CGFloat) {
        switch self {
        case .small:
            return (30.8, 30.33)
        case .big:
            return (65, 64)
        }
    }
}

struct ProfileView: View {
    // MARK: - Properties
    var imageName: String? = nil
    var hasStory = false
    var size = ProfileSize.big
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            ZStack {
                if let imageName = imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(width: size.value.width, height: size.value.height)
            .background(Color("Surface"))
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color("Surface"), lineWidth: 0.6)
            )
            .padding(.all, 5)
            .overlay(
                Circle()
                    // inner border
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                Color("StoryAccent1"),
                                Color("StoryAccent2")
                            ],
                            startPoint: .bottomLeading,
                            endPoint: .topTrailing),
                        lineWidth: hasStory ? 3.2 : 0
                    )
            )
        }
        .buttonStyle(ButtonScaleStyle())
    }
}

// MARK: - Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(hasStory: true, action: {})
            .previewDisplayName("Profile with Story (Big)")
            .previewLayout(.sizeThatFits)
            .background(Color.white)
            .padding()
        
        ProfileView(
            hasStory: true,
            size: .small,
            action: {}
        )
            .previewDisplayName("Profile with Story (Small)")
            .previewLayout(.sizeThatFits)
            .background(Color.white)
            .padding()
        
        ProfileView(action: {})
            .previewDisplayName("Profile (Big)")
            .previewLayout(.sizeThatFits)
            .background(Color.white)
            .padding()
        
        ProfileView(size: .small, action: {})
            .previewDisplayName("Profile (Small)")
            .previewLayout(.sizeThatFits)
            .background(Color.white)
            .padding()
    }
}

struct ButtonScaleStyle: ButtonStyle {
    @State var scaleAmount: CGFloat = 1.0
        
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(scaleAmount)
            .animation(
                .spring(response: 0.5, dampingFraction: 0.7),
                value: scaleAmount
            )
            .onChange(of: configuration.isPressed) { isPressed in
                scaleAmount = isPressed ? 0.85 : 1.0
            }
    }
}