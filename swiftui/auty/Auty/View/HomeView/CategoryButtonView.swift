//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct CategoryButtonView: View {
  // MARK: - PROPERTY
  var icon: String
  var title: String
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      Button {
        
      } label: {
        ZStack {
          Color(.colorWhite)
          
          Image(icon)
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
        }
        .frame(width: 75, height: 75)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .colorBlack, radius: 2, x: 1, y: 1)
      }
      
      Text(title)
        .font(.system(size: 18, design: .rounded))
        .foregroundStyle(.secondary)
    }
    .padding(3)
  }
}

// MARK: PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
  CategoryButtonView(icon: "bulb", title: "Info")
}
