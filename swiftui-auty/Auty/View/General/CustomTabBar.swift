//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

enum Tab: String, CaseIterable {
  case home
  case course
  case cart
  case profile
}

struct CustomTabBar: View {
  // MARK: - PROPERTY
  @Binding var selectedTab: Tab
  private var image: String {
    selectedTab.rawValue
  }
  
  private var tabColor: Color {
    switch selectedTab {
    case .home:
        .mint
    case .course:
        .green
    case .cart:
        .indigo
    case .profile:
        .orange
    }
  }
  
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      HStack {
        ForEach(Tab.allCases, id: \.rawValue) { tab in
          Spacer()
          
          Image(selectedTab == tab ? image : tab.rawValue)
            .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
            .foregroundStyle(selectedTab == tab ? tabColor : .gray)
            .font(.system(size: 22))
            .onTapGesture {
              withAnimation(.easeIn(duration: 0.1)) {
                selectedTab = tab
              }
            }
          
          Spacer()
        }
      }
      .frame(width: nil, height: 60)
      .background(.colorBlue)
      .clipShape(RoundedRectangle(cornerRadius: 10))
      .padding()
    }
    .shadow(color: .colorBlack.opacity(0.4) ,radius: 5, x: 2, y: 2)
  }
}

// MARK: PREVIEW
#Preview {
  CustomTabBar(selectedTab: .constant(.home))
}
