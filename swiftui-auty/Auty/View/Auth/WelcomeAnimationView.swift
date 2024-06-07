//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct WelcomeAnimationView: View {
  // MARK: - PROPERTY
  
  @State private var isAnimating: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      CircleGroupView(ShapeColor: .colorBlue, ShapeOpacity: 0.2)
      
      Image("welcome")
        .resizable()
        .scaledToFit()
        .padding(50)
    }//: CENTER
    .blur(radius: isAnimating ? 0 : 2)
    .opacity(isAnimating ? 1 : 0.8)
    .scaleEffect(isAnimating ? 1 : 0.9)
    .animation(.easeOut(duration: 0.6).repeatForever(), value: isAnimating)
    .onAppear {
      self.isAnimating = true
    }
  }
}

// MARK: PREVIEW
#Preview {
  WelcomeAnimationView()
}
