//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct HeaderView: View {
  // MARK: - PROPERTY
  var title: String
  var isTrailingButtonActive: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      Color(.colorBlue)
      
      HStack(alignment: .center) {
        EmptyCircleView()
        
        Spacer()
        
        Text(title.uppercased())
          .font(.system(size: 24, weight: .bold, design: .rounded))
          .foregroundStyle(.colorWhite)
        
        
        Spacer()
        
        if isTrailingButtonActive {
          Button {
            // ACTION
          } label: {
            Image(systemName: "bell")
              .resizable()
              .scaledToFit()
              .frame(width: 30)
              .foregroundStyle(.colorWhite)
          }
          .overlay(alignment: .topTrailing) {
            Circle()
              .frame(width: 15, height: 15)
              .foregroundStyle(.red)
          }
        } else {
          EmptyCircleView()
        }
      }
      .padding(.horizontal, 20)
    }//: HEADER
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .frame(height: 80)
  }
}

// MARK: PREVIEW
#Preview {
  HeaderView(title: "Hello World")
}

struct EmptyCircleView: View {
  var body: some View {
    Circle()
      .frame(width: 30)
      .foregroundStyle(.clear)
  }
}
