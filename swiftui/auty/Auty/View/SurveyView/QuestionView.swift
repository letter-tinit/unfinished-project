//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct QuestionView: View {
  // MARK: - PROPERTY
  
  @Binding var question: Question
  
  // MARK: - BODY
  
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Text(question.title)
        .font(.system(size: 24, weight: .semibold, design: .rounded))
        .padding(.bottom, 15)
        .foregroundStyle(.colorWhite)
        .shadow(color: .colorBlack.opacity(0.1), radius: 5, x: 2, y: 2)
      
      ForEach(question.options, id: \.self) { option in
        Button {
          question.selection = option
        } label: {
          ZStack(alignment: .center) {
            HStack {
              Spacer()
              if question.selection == option {
                RoundedRectangle(cornerRadius: 10)
                  .stroke(.colorWhite, lineWidth: 2)
                  .frame(width: 230, height: 50)
                  .background {
                    Color.yellow
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                  }
              } else {
                RoundedRectangle(cornerRadius: 10)
                  .stroke(.colorWhite, lineWidth: 2)
                  .frame(width: 230, height: 50)
              }
              Spacer()
            }
            
            Text(option)
              .font(.system(size: 20, weight: .semibold, design: .rounded))
              .foregroundStyle(.colorWhite)
          }
        }
        .shadow(color: .colorBlack.opacity(0.4), radius: 5, x: 2, y: 2)
      }
    }
    .padding(.horizontal, 20)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
//    .frame(width: 340, height: 620, alignment: .leading)
    .background(
      Color.colorBlue.opacity(0.9)
    )
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .shadow(color: .colorBlack.opacity(0.3), radius: 5, x: 2, y: 2)
  }
}

// MARK: PREVIEW
#Preview {
  QuestionView(question: .constant(Question(title: "When was the iPhone first released")))
}
