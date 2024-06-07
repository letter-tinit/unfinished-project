//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct SurveyHeaderView: View {
  // MARK: - PROPERTY
  var title: String
  @Binding var isFinished: Bool
  
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
        
        Button {
          // ACTION
        } label: {
          Image(systemName: "square.and.arrow.down")
            .resizable()
            .scaledToFit()
            .frame(width: 30)
//            .foregroundStyle(isFinished ? .green : .gray)
            .foregroundStyle(.yellow)
        }
//        .disabled(!isFinished)
      }
      .padding(.horizontal, 20)
    }//: HEADER
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .frame(height: 80)
  }
}

// MARK: PREVIEW
#Preview {
  SurveyHeaderView(title: "Hello World", isFinished: .constant(false))
}
