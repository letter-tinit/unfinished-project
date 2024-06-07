//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct MyCourseButtonView: View {
  // MARK: - PROPERTY
  
  // MARK: - BODY
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Image("navigation-01")
        .resizable()
        .scaledToFill()
        .frame(width: 230, height: 160)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
          Button {
            
          } label: {
            Image(systemName: "play")
              .scaleEffect(3)
              .foregroundStyle(.yellow)
          }
        }
        .shadow(color: .colorBlack.opacity(0.4), radius: 7)

      Text("Khoá học vỡ nòng")
        .font(.system(size: 15))
        .fontWeight(.semibold)
        .fontDesign(.rounded)
        .foregroundStyle(.colorBlue)
        .shadow(color: .colorBlack.opacity(0.4), radius: 8)
        .lineLimit(nil)
        .truncationMode(.tail)

    }
    .frame(width: 230, height: 220, alignment: .top)
    .padding(.horizontal)
    .padding(.top)
  }
}

// MARK: PREVIEW
#Preview {
  MyCourseButtonView()
}
