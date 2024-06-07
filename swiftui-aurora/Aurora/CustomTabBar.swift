//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

enum Tab: String, CaseIterable {
  case home
  case toy
  case cart
  case profile
}

struct CustomTabBar: View {
  // MARK: - PROPERTY
  var width = UIScreen.main.bounds.width
  
  @Binding var selectedTab: Tab
  
  private var image: String {
    selectedTab.rawValue
  }
  
  private var tabColor: Color {
    switch selectedTab {
    case .home:
        .colorRed
    case .toy:
        .colorRed
    case .cart:
        .colorRed
    case .profile:
        .colorRed
    }
  }
  
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      Spacer()
      
      VStack(spacing: 0) {
        RoundedRectangle(cornerRadius: 0)
          .frame(width: width, height: 2)
          .foregroundStyle(Color(uiColor: .systemGray5))
          .shadow(color: .black, radius: 4, x: 0, y: 4)
          .padding(.top, 8)
        
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
        .frame(width: width, height: 60/*, alignment: .top*/)
        .background(.white)
        .padding(.horizontal)
      }
    }
  }
}

// MARK: PREVIEW
#Preview {
  CustomTabBar(selectedTab: .constant(.home))
}
