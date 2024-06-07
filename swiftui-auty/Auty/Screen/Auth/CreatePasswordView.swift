//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI
import Lottie

struct CreatePasswordView: View {
  // MARK: - PROPERTY
  
  
  @State private var password: String = ""
  @State private var confirmPassword: String = ""
  
  // MARK: - BODY
  
  var body: some View {
    NavigationStack {
      VStack {
        // MARK: - ANIMATION
        LottieView(animation: .named("authentication"))
          .playing()
          .looping()
          .resizable()
          .scaledToFit()
          .scaleEffect(0.8)
          .shadow(color: .colorBlack.opacity(0.3), radius: 4, x: 2, y: 2)

        VStack(alignment: .center, spacing: 30) {
          // MARK: - PASSWORD TEXTFIELD
          ZStack {
            RoundedRectangle(cornerRadius: 10)
              .stroke(.colorBlue, lineWidth: 2)
              .shadow(color: .colorBlack.opacity(0.7),radius: 4, x: 2, y: 2)
            
            TextField(Strings.Common.password, text: $password)
              .font(.system(size: 22, weight: .medium, design: .rounded))
              .padding()
              .textInputAutocapitalization(.never)
              .shadow(color: .colorBlack.opacity(0.3), radius: 3, x: 2, y: 2)
          }// PASSWORD TEXTFIELD
          .frame(width: 340, height: 60)
          
          // MARK: - CONFIRM PASSWORD TEXTFIELD
          ZStack {
            RoundedRectangle(cornerRadius: 10)
              .stroke(.colorBlue, lineWidth: 2)
              .shadow(color: .colorBlack.opacity(0.7),radius: 4, x: 2, y: 2)
            
            TextField(Strings.Common.confirmPassword, text: $confirmPassword)
              .font(.system(size: 22, weight: .medium, design: .rounded))
              .padding()
              .textInputAutocapitalization(.never)
              .shadow(color: .colorBlack.opacity(0.3), radius: 3, x: 2, y: 2)
          }// CONFIRM PASSWORD TEXTFIELD
          .frame(width: 340, height: 60)
        }// VSTACK TextFields
        
        
        Spacer()
        
        // MARK: - NEXT BUTTON LINK
        NavigationLink {
          CreateProfileView()
        } label: {
          ZStack {
            Capsule()
            Text("Tiếp Theo")
              .foregroundStyle(.colorWhite)
              .font(.system(size: 22, weight: .semibold, design: .rounded))
          }
          .shadow(color: .colorBlack.opacity(0.6), radius: 4, x: 2, y: 2)
          .frame(height: 50)
          .padding()
        }//NEXT BUTTON LINK
      }
    }
  }
}

// MARK: PREVIEW
#Preview {
  CreatePasswordView()
}
