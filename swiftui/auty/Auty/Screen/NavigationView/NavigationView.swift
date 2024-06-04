//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct NavigationView: View {
  // MARK: - PROPERTY
  
  
  
  @AppStorage("home") var isHomeViewActive: Bool = false
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
  @AppStorage("information") var isInformationViewActive: Bool = false
  @AppStorage("survey") var isSurveyViewActive: Bool = false
  
  @State private var isAnimating: Bool = false
  @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
  @State private var buttonOffset: CGFloat = 0
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      // MARK: - HEADER
      
      HeaderView(title: Strings.NavigationView.learning)
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -40)
        .animation(.easeOut(duration: 1), value: isAnimating)
      
      // MARK: - CENTER
      
      ScrollView {
        VStack(spacing: 20) {
          Button {
            isInformationViewActive = true
          } label: {
            NavigationButtonView(image: "navigation-01", title: Strings.NavigationView.information)
          }
          
          Button {
            isHomeViewActive = true
          } label: {
            NavigationButtonView(image: "navigation-02", title: Strings.NavigationView.learning)
          }
          
          Button {
            isSurveyViewActive = true
          } label: {
            NavigationButtonView(image: "navigation-03", title: Strings.NavigationView.survey)
          }
        }
        .padding(20)
      }
      .scaleEffect(isAnimating ? 1 : 0.6)
      .opacity(isAnimating ? 1 : 0)
      .animation(.easeInOut(duration: 1), value: isAnimating)
      
      Spacer(minLength: 20)
      
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
        Text(Strings.Common.skip)
          .font(.system(.title3, design: .rounded))
          .fontWeight(.bold)
          .foregroundColor(.gray)
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
                    isOnboardingViewActive = true
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
      .opacity(isAnimating ? 1 : 0)
      .offset(y: isAnimating ? 0 : 40)
      .animation(.easeOut(duration: 1), value: isAnimating)
    }//: VSTACK
    .padding()
    .onAppear {
      self.isAnimating = true
      self.isSurveyViewActive = false
      self.isInformationViewActive = false
    }
  }
}

// MARK: PREVIEW
#Preview {
  NavigationView()
}
