//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct OnboardingView: View {
  // MARK: - PROPERTY
  
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
  @State private var buttonOffset: CGFloat = 0
  @State private var isAnimating: Bool = false
  @State private var imageOffset: CGSize = .zero
  @State private var indicatorOpacity: Double = 1.0
  @State private var textTitle: String = "Share."
  
  // MARK: - BODY
  
  var body: some View {
    VStack(spacing: 20) {
      // MARK: - HEADER
      
      Spacer()
      
      VStack(spacing: 0) {
        Text(Strings.OnboardingView.welcome)
          .font(.system(size: 60))
          .fontWeight(.heavy)
          .foregroundColor(.colorBlack)
          .transition(.opacity)
        
        Text("""
        \(Strings.OnboardingView.note)
        """)
        .font(.title3)
        .fontWeight(.light)
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 10)
      } //: HEADER
      .opacity(isAnimating ? 1 : 0)
      .offset(y: isAnimating ? 0 : -40)
      .animation(.easeOut(duration: 1), value: isAnimating)
      
      Spacer()
      
      // MARK: - CENTER
      ZStack {
        CircleGroupView(ShapeColor: .colorBlue, ShapeOpacity: 0.2)
        
        Image("welcome")
          .resizable()
          .scaledToFit()
          .padding(50)
          .opacity(isAnimating ? 1 : 0)
          .animation(.easeInOut(duration: 0.5), value: isAnimating)
          
          .animation(.easeOut(duration: 1), value: imageOffset)
      }//: CENTER
      
      Spacer()
      
      // MARK: - FOOTER
      
      ZStack {
        // PARTS OF THE CUSTOM BUTTON
        
        // 1. BACKGROUND (STATIC)
        Capsule()
          .fill(.colorBlue.opacity(0.2))
        
        Capsule()
          .fill(.colorBlue.opacity(0.2))
          .padding(8)
        
        // 2. CALL-TO-ACTION (STATIC)
        Text(Strings.OnboardingView.getStarted)
          .font(.system(.title3, design: .rounded))
          .fontWeight(.bold)
          .foregroundColor(.colorBlack)
          .offset(x: 20)
        
        // 3. CAPSULE (DYNAMIC WIDTH)
        HStack {
          Capsule()
            .fill(.colorBlue)
            .frame(width: buttonOffset + 80)
          
          Spacer()
        }
        
        // 4. CIRCLE (DRAGGABLE)
        HStack {
          ZStack {
            Circle()
              .fill(.colorBlue)
            Circle()
              .fill(.colorBlack.opacity(0.35))
              .padding(8)
            Image(systemName: "chevron.right.2")
              .font(.system(size: 24, weight: .bold))
          }
          .foregroundColor(.colorWhite)
          .frame(width: 80, height: 80, alignment: .center)
          .offset(x: buttonOffset)
          .gesture(
            DragGesture()
              .onChanged { gesture in
                if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                  buttonOffset = gesture.translation.width
                }
              }
              .onEnded { _ in
                withAnimation(Animation.easeOut(duration: 0.4)) {
                  if buttonOffset > buttonWidth / 2 {
                    buttonOffset = buttonWidth - 80
                    isOnboardingViewActive = false
                  } else {
                    buttonOffset = 0
                  }
                }
              }
          ) //: GESTURE
          
          Spacer()
        } //: HSTACK
      } //: FOOTER
      .frame(width: buttonWidth , height: 80, alignment: .center)
      .padding()
      .opacity(isAnimating ? 1 : 0)
      .offset(y: isAnimating ? 0 : 40)
      .animation(.easeOut(duration: 1), value: isAnimating)
    }//: VSTACK
    .onAppear {
      self.isAnimating = true
    }
  }
}

// MARK: PREVIEW
#Preview {
  OnboardingView()
}
