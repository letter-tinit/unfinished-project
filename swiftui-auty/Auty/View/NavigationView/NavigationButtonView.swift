//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct NavigationButtonView: View {
  // MARK: - PROPERTY
  var image: String
  var title: String
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      Color.colorWhite
      
      VStack(spacing: 10) {
        Image(image)
          .resizable()
          .frame(width: 260)
          .overlay(alignment: .bottom) {
            Divider()
          }
        
        Text(title)
          .font(.system(size: 22, weight: .bold,design: .rounded))
          .foregroundStyle(.colorBlue)
          .padding(.bottom, 15)
      }
    }
    .clipShape(RoundedRectangle(cornerRadius: 10))
    .frame(width: 260, height: 190)
    .shadow(color: .colorBlack.opacity(0.6), radius: 2)
    .padding(5)
  }
}

// MARK: PREVIEW
#Preview {
  NavigationButtonView(image: "navigation-01", title: "Autism Information")
}
