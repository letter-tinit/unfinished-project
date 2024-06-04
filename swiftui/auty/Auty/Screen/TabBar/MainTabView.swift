//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct MainTabView: View {
  // MARK: - PROPERTY
  
  @State private var selectedTab: Tab = .cart
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      VStack {
        TabView(selection: $selectedTab) {
          switch selectedTab {
          case .home:
            HomeView()
          case .course:
            CourseView()
          case .cart:
            CartView()
          case .profile:
            ProfileView()
          }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
      }
      
      VStack {
        Spacer()
        CustomTabBar(selectedTab: $selectedTab)
      }
    }
  }
}

// MARK: PREVIEW
#Preview {
  MainTabView()
}
