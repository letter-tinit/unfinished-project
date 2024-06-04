//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct LoginView: View {
  // MARK: - PROPERTY
  
  
  
  @State private var emailTextField: String = ""
  @State private var passwordTextField: String = ""
  @State var isShowingPassword: Bool = false
  
  @State private var isAnimating: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      Spacer(minLength: 30)
      
      // MARK: - HEADER
      VStack {
        Image("welcome")
          .resizable()
          .scaledToFit()
        
        Text(Strings.LoginView.welcomeBack)
          .font(.system(size: 22, weight: .bold, design: .rounded))
          .foregroundStyle(.colorBlue)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        Text(Strings.LoginView.quote)
          .font(.system(size: 16, weight: .medium, design: .rounded))
          .foregroundStyle(.colorBlue)
          .frame(maxWidth: .infinity, alignment: .leading)
          .multilineTextAlignment(.leading)
        Spacer(minLength: 40)
      }//HEADER
      .opacity(isAnimating ? 1 : 0)
      .offset(y: isAnimating ? 0 : -40)
      .animation(.easeOut(duration: 1), value: isAnimating)
      
      // MARK: - CENTER
      VStack(spacing: 20) {
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .stroke(.colorBlue, lineWidth: 2)
          
          TextField(Strings.Common.email, text: $emailTextField)
            .font(.system(size: 22, weight: .medium, design: .rounded))
            .padding()
            .textInputAutocapitalization(.never)
        }
        .frame(width: 340, height: 60)
        .shadow(color: .colorBlack.opacity(0.4),radius: 2, x: 1, y: 1)
        
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .stroke(.colorBlue, lineWidth: 2)
          
          Group {
            if self.isShowingPassword {
              TextField(Strings.Common.password, text: $passwordTextField)
            } else {
              SecureField(Strings.Common.password, text: $passwordTextField)
            }
          }
          .font(.system(size: 22, weight: .medium, design: .rounded))
          .autocorrectionDisabled(true)
          .padding()
          .overlay(alignment: .trailing) {
            Button {
              self.isShowingPassword.toggle()
            } label: {
              Image(systemName: self.isShowingPassword ? "eye" : "eye.slash")
                .padding(.trailing, 16)
            }
          }
        }
        .frame(width: 340, height: 60)
        .shadow(color: .colorBlack.opacity(0.4),radius: 2, x: 1, y: 1)
        
      }//: CENTER
      .scaleEffect(isAnimating ? 1 : 0.6)
      .opacity(isAnimating ? 1 : 0)
      .animation(.easeOut(duration: 1), value: isAnimating)
      
      Spacer(minLength: 50)
      
      // MARK: - FOOTER
      VStack {
        // MARK: - LOGIN BUTTON
        Button {
          
        } label: {
          ZStack {
            RoundedRectangle(cornerRadius: 14)
              .frame(width: 340, height: 60)
            
            Text(Strings.Common.login)
              .font(.system(size: 24, weight: .bold, design: .rounded))
              .foregroundStyle(.colorWhite)
          }
        }//: LOGIN BUTTON
        
        VStack(alignment: .center) {
          Text(Strings.LoginView.note)
            .modifier(TextModifier())
          
          HStack {
            Button {
              
            } label: {
              Text(Strings.LoginView.term)
                .modifier(PartitionTextModifier())
            }
            
            Text(Strings.Common.and)
              .modifier(TextModifier())
            
            Button {
              
            } label: {
              Text(Strings.LoginView.privacy)
                .modifier(PartitionTextModifier())
            }
          }
        }//: TERMS OF USE
        
        ZStack {
          Capsule()
            .frame(height: 2)
            .padding(.horizontal, 4)
            .foregroundStyle(.yellow)
          
          RoundedRectangle(cornerRadius: 5)
            .frame(width: 55, height: 24)
            .foregroundStyle(.yellow)
          
          Text(Strings.LoginView.alter)
            .foregroundStyle(.colorWhite)
            .font(.system(size: 14, weight: .medium, design: .rounded))
        }//: DIVIDER
        
        HStack {
          Button {
            
          } label: {
            AlternateLogin(image: "google")
          }
          
          Spacer(minLength: 30)
          
          Button {
            
          } label: {
            AlternateLogin(image: "facebook")
          }
          
        }
        .padding(.horizontal, 8)
        
        HStack(spacing: 3) {
          Text(Strings.LoginView.suggest)
            .modifier(TextModifier())
          Button {
            
          } label: {
            Text(Strings.LoginView.here)
              .modifier(PartitionTextModifier())
          }
        }
      }
      .opacity(isAnimating ? 1 : 0)
      .offset(y: isAnimating ? 0 : 40)
      .animation(.easeOut(duration: 1), value: isAnimating)
      
    }//: VSTACK
    .shadow(color: .colorBlack.opacity(0.2),radius: 5, x: 5, y: 5)
    .padding(.horizontal, 40)
    .onAppear {
      self.isAnimating = true
    }
  }
}

// MARK: PREVIEW
#Preview {
  LoginView()
}
