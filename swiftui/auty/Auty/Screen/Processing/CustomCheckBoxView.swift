//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct CustomCheckBoxView: View {
  // MARK: - PROPERTY
  @Binding var isChecked: Bool
  
  // MARK: - BODY
  
  var body: some View {
    Button {
      isChecked.toggle()
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: 4)
          .stroke(.colorBlue, lineWidth: 2)
          .frame(width: 20, height: 20)
        
        if isChecked {
          Image(systemName: "checkmark")
            .foregroundStyle(.green)
            .fontWeight(.bold)
            .scaleEffect(0.9)
        }
      }
    }
  }
}

// MARK: PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
  CustomCheckBoxView(isChecked: .constant(false))
}
