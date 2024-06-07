//
// Created by Treasure Letter ♥
// 
// https://github.com/tinit4ever
//

import SwiftUI

struct CircleImage: View {
    // MARK: - PROPERTY
  var image: String

    // MARK: - BODY

  var body: some View {
    Image(image)
      .resizable()
      .scaledToFill()
      .frame(width: 150, height: 150)
      .background(
        Color.colorBlue
      )
      .clipShape(
        Circle()
      )
      .clipped()
      .overlay(Circle().stroke(Color.primary.opacity(0.7), lineWidth: 4))
      .shadow(color: .colorBlack.opacity(0.4), radius: 10)
  }
}

// MARK: PREVIEW
#Preview {
  CircleImage(image: "avatar")
}
