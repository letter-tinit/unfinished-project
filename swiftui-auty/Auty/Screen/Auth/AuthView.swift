//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct AuthView: View {
  // MARK: - PROPERTY
  @State private var isAnimating: Bool = false
  
  
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      Spacer()
      VStack {
        Image("study")
          .padding()
          .scaleEffect(isAnimating ? 1 : 0.9)
          .opacity(isAnimating ? 0.8 : 1)
          .animation(.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: self.isAnimating)
        
        Text(Strings.AuthView.slogan.uppercased())
          .font(.system(size: 24, weight: .bold, design: .rounded))
          .foregroundStyle(.colorBlue)
          .padding()
        Capsule()
          .frame(width: 100, height: 4)
          .foregroundStyle(.colorBlue)
        
        Text(Strings.AuthView.quote)
          .font(.system(size: 18, weight: .medium, design: .rounded))
          .multilineTextAlignment(.center)
          .padding(.horizontal, 40)
          .padding(.vertical, 20)
          .foregroundStyle(.colorBlue)
      }
      .scaleEffect(isAnimating ? 1 : 0.6)
      .opacity(isAnimating ? 1 : 0.2)

      Spacer()
      
      VStack(spacing: 25) {
        // MARK: - LOGIN BUTTON
        Button {
          
        } label: {
          ZStack {
            RoundedRectangle(cornerRadius: 14)
              .frame(width: 340, height: 60)
            
            RoundedRectangle(cornerRadius: 14)
              .frame(width: 335, height: 55)
              .foregroundStyle(.colorWhite)
            
            Text(Strings.Common.login)
              .font(.system(size: 24, weight: .bold, design: .rounded))
          }
        }
        .offset(x: self.isAnimating ? 0.0 : -260.0)

        // MARK: - REGISTER BUTTON
        Button {
          
        } label: {
          ZStack {
            RoundedRectangle(cornerRadius: 14)
              .frame(width: 340, height: 60)
            
            Text(Strings.Common.register)
              .font(.system(size: 24, weight: .bold, design: .rounded))
              .foregroundStyle(.colorWhite)
          }
        }
        .offset(x: self.isAnimating ? 0.0 : 260.0)
      }
      .opacity(self.isAnimating ? 1 : 0.0)
      Spacer()
    }
    .shadow(color: .colorBlack.opacity(0.2),radius: 5, x: 5, y: 5)
    .animation(.easeInOut(duration: 0.8), value: isAnimating)
    .onAppear {
      self.isAnimating = true
    }
  }
}

// MARK: PREVIEW
#Preview {
  AuthView()
}
