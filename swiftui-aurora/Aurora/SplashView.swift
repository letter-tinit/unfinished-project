//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI
import Lottie

struct SplashView: View {
  // MARK: - PROPERTY
  @State var loading: Bool = true
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      if loading {
        ZStack {
          Color.accentColor
            .ignoresSafeArea(.all)
          
          VStack(spacing: 0) {
            Spacer()
            
            Image("splash-logo")
              .resizable()
              .scaledToFit()
              .padding(40)
            
            LottieView(animation: .named("loading"))
              .playing()
              .animationSpeed(2.0)
              .animationDidFinish { _ in
                loading = false
              }
              .padding(.horizontal)
          }
          .padding(.bottom, -60)
          .padding(.top, 100)
        }
      } else {
        HomeView()
      }
    }
  }
}

// MARK: PREVIEW
#Preview {
  SplashView()
}
