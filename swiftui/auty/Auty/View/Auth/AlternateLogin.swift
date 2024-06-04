//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct AlternateLogin: View {
  // MARK: - PROPERTY
  var image: String
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10)
        .stroke(style: StrokeStyle())
        .frame(width: 130, height: 40)
        .foregroundStyle(.colorBlue)
      
      Image(image)
        .resizable()
        .scaledToFit()
        .frame(width: 25, height: 25)
    }
    .shadow(color: .colorBlack.opacity(0.3),radius: 3, x: 1, y: 1)
  }
}

// MARK: PREVIEW
#Preview {
  AlternateLogin(image: "google")
}
