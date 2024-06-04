//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct ResultRowView: View {
  // MARK: - PROPERTY
  var title: String
  var content: String
  
  // MARK: - BODY
  
  var body: some View {
    HStack(alignment: .center) {
      Text(title)
        .font(.system(size: 15, weight: .medium, design: .rounded))
        .foregroundStyle(.colorWhite)
      
      Spacer()
      
      Text(content)
        .font(.system(size: 15, weight: .medium, design: .rounded))
        .foregroundStyle(.colorWhite)
    }
  }
}

// MARK: PREVIEW
#Preview {
  ResultRowView(title: "Sub total", content: "930.000 VND")
}
