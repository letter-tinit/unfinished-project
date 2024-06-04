//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct RatingView: View {
  // MARK: - PROPERTY
  
  var rating: Int
  
  // MARK: - BODY
  
  var body: some View {
    HStack(alignment: .center, spacing: 5) {
      ForEach(1...(rating), id: \.self) { _ in
        Image(systemName: "star.fill")
          .font(.body)
          .foregroundColor(Color.yellow)
      }
    }
  }
}

// MARK: PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
  RatingView(rating: 5)
    .padding()
}
