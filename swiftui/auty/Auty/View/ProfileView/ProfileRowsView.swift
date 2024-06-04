//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct ProfileRowsView: View {
  // MARK: - PROPERTY
  var image: String
  var title: String
  var titleColor: Color = .primary
  var isHiddenNavigation: Bool = false
  var destination: AnyView
  
  var primaryColor: Color = .colorBlue

  // MARK: - BODY
  
  var body: some View {
    HStack {
      
      NavigationLink {
        destination
      } label: {
        CircleButtonView(image: image, primaryColor: primaryColor)
        
        Text(title)
          .font(.system(size: 16, weight: .medium, design: .rounded))
          .foregroundStyle(titleColor)
          .padding(.horizontal, 5)
        
        Spacer()
        
        if !isHiddenNavigation {
          Image(systemName: "chevron.right")
            .scaledToFit()
            .foregroundStyle(Color.primary)
        }
      }
    }
    .padding(.horizontal, 40)
    .shadow(color: .colorBlack.opacity(0.2),radius: 5, x: 5, y: 5)
  }
}

// MARK: PREVIEW
#Preview(traits: .fixedLayout(width: 375, height: 60)) {
  ProfileRowsView(image: "gear", title: "Settings", destination: AnyView(HomeView()))
    .padding()
}
