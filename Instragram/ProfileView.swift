//
//  ProfileView.swift
//  Instragram
//
//  Created by Wind Versi on 29/3/22.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Properties
    var title: String
    var imageName: String? = nil
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 3) {
            
            // Row 1: Profile
            Button(action: {}) {
                ZStack {
                    if let imageName = imageName {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                    }
                }
                .frame(width: 74, height: 74)
                .background(Color("Surface"))
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color("Surface"), lineWidth: 0.6)
                )
                .padding(.all, 5)
                .overlay(
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color("StoryAccent1"),
                                    Color("StoryAccent2")
                                ],
                                startPoint: .bottomLeading,
                                endPoint: .topTrailing),
                            lineWidth: 3.2
                        )
                )
            }
            .buttonStyle(ButtonScaleStyle())
            
            // Row 2: Title
            Text(title)
                .font(Font.system(size: 14))
                .kerning(0.4)
                .lineLimit(1)
                .foregroundColor(.black)
                .padding(.top, 8)
        }
    }
}

// MARK: - Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(title: "netflix", imageName: "netflixLogo")
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
