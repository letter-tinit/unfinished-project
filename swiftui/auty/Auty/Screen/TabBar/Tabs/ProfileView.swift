//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct ProfileView: View {
  // MARK: - PROPERTY
  @State private var isAnimating: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    NavigationStack {
      VStack {
        // MARK: - HEADER
        
        VStack {
          HeaderView(title: Strings.ProfileView.profile)
            .padding()
          
          CircleImage(image: "avatar")
            .overlay(alignment: .bottomTrailing) {
              
              Button {
                
              } label: {
                ZStack(alignment: .center) {
                  RoundedRectangle(cornerRadius: 10)
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.primary)
                  
                  Image(systemName: "pencil")
                    .foregroundStyle(.colorBlack)
                    .scaleEffect(1.2)
                }
              }
              .shadow(color: .colorBlack.opacity(0.2),radius: 5, x: 5, y: 5)
            }
          
          VStack {
            Text("John Doe")
              .font(.system(size: 26, weight: .semibold, design: .rounded))
              .foregroundStyle(.primary)
            
            Text("johndoe@yahoo.com")
              .font(.system(size: 18, weight: .regular, design: .rounded))
              .foregroundStyle(.secondary)
          }
          .padding(.bottom)
          .shadow(color: .colorBlack.opacity(0.2),radius: 5, x: 5, y: 5)
        }
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -60)
        .animation(.easeOut(duration: 1.2), value: isAnimating)
        
        ScrollView(.vertical) {
          // MARK: - CENTER
          Divider()
          
          ProfileRowsView(image: "gear", title: Strings.ProfileView.setting, destination: AnyView(HomeView()))
          
          ProfileRowsView(image: "creditcard", title: Strings.ProfileView.payment, destination: AnyView(HomeView()))
          
          ProfileRowsView(image: "questionmark", title: Strings.ProfileView.frequentlyAsk, destination: AnyView(HomeView()))
          
          ProfileRowsView(image: "stethoscope", title: Strings.ProfileView.customerCare, destination: AnyView(HomeView()))
          
          Divider()
          
          ProfileRowsView(image: "power", title: Strings.Common.logout, titleColor: .red, isHiddenNavigation: true, destination: AnyView(HomeView()), primaryColor: .red)
            .padding(.bottom, 120)
          
          // MARK: - FOOTER
        }
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 60)
        .animation(.easeOut(duration: 1.2), value: isAnimating)
      }
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
          self.isAnimating = true
        }
      }
    }
  }
}

// MARK: PREVIEW
#Preview() {
  ProfileView()
}


struct Divider: View {
  var body: some View {
    Capsule()
      .frame(width: UIScreen.main.bounds.width - 80, height: 1)
      .foregroundStyle(.colorBlack.opacity(0.2))
      .padding(.vertical)
  }
}
