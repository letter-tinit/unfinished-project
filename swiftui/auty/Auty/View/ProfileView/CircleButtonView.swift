//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct CircleButtonView: View {
  // MARK: - PROPERTY
  var image: String
  
  var primaryColor: Color

  // MARK: - BODY
  
  var body: some View {
    ZStack(alignment: .center) {
      primaryColor.opacity(0.3)
      
      Image(systemName: image)
        .resizable()
        .scaledToFit()
        .foregroundStyle(primaryColor)
        .frame(width: 20, height: 20)
    }
    .frame(width: 40, height: 40)
    .clipShape(Circle())
  }
}

// MARK: PREVIEW
#Preview {
  CircleButtonView(image: "gear", primaryColor: .colorBlue)
}
