//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct RegisterView: View {
  // MARK: - PROPERTY
  
  
  @State private var emailTextField: String = ""
  
  // MARK: - BODY
  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        Spacer()
        
        // MARK: - HEADER
        VStack {
          Text(Strings.RegisterView.welcome)
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundStyle(.colorBlue)
          
          Text(Strings.RegisterView.quote)
            .font(.footnote)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .padding()
            .padding(.horizontal, 30)
        }
        .shadow(color: .colorBlack.opacity(0.2), radius: 2, x: 3, y: 3)
        
        Spacer()
        // MARK: - EMAIL TEXT FIELD
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .stroke(.colorBlue, lineWidth: 2)
            .shadow(color: .colorBlack.opacity(0.7),radius: 4, x: 2, y: 2)
          
          TextField(Strings.Common.email, text: $emailTextField)
            .font(.system(size: 22, weight: .medium, design: .rounded))
            .padding()
            .textInputAutocapitalization(.never)
            .shadow(color: .colorBlack.opacity(0.3), radius: 3, x: 2, y: 2)
        }// EMAIL TEXTFIELD
        .frame(width: 340, height: 60)
        
        
        Spacer()
        // MARK: - NEXT BUTTON LINK
        NavigationLink {
          CreatePasswordView()
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
        
        
        Spacer()
        // MARK: - DIVIDER
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
        .padding(.horizontal)
        .shadow(color: .colorBlack.opacity(0.2),radius: 5, x: 5, y: 5)

        Spacer()
        // MARK: - ALTERNATE BUTTON
        HStack(alignment: .center) {
          Spacer()
          
          Button {
            
          } label: {
            AlternateLogin(image: "google")
          }
          
          Spacer(minLength: 40)
          
          Button {
            
          } label: {
            AlternateLogin(image: "facebook")
          }
          
          Spacer()
        }
        .shadow(color: .colorBlack.opacity(0.3), radius: 5, x: 5, y: 5)
        
        // MARK: - SUGGEST
        HStack(spacing: 3) {
          Text(Strings.RegisterView.suggest)
            .modifier(TextModifier())
          Button {
            
          } label: {
            Text(Strings.RegisterView.login)
              .modifier(PartitionTextModifier())
          }
        }// Suggest
        .padding(.top, 20)
        .shadow(color: .colorBlack.opacity(0.2), radius: 2, x: 2, y: 2)
        
      }//: VSTACK
    }
  }
}

// MARK: PREVIEW
#Preview {
  RegisterView()
}
