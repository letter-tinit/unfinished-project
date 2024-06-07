//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct SurveyView: View {
  
  // MARK: - PROPERTY
  
  
  @AppStorage("survey") var isSurveyViewActive: Bool = true
  
  @State var manager = QuizManager()
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      // MARK: - HEADER
      SurveyHeaderView(title: Strings.SurveyView.title, isFinished: $manager.canSubmit)
        .padding()
        .shadow(color: .colorBlack.opacity(0.4), radius: 5, x: 2, y: 2)
      
      Spacer()
      
      ProgressView(value: manager.progress, total: 1) {
        HStack {
          Text("\(Strings.SurveyView.progress):")
            .foregroundStyle(.colorBlack)
            .font(.system(size: 16, weight: .semibold, design: .rounded))
          
          Text(String(format: "%.2f%%", round(100 * manager.progress * 100) / 100))
            .foregroundStyle(.colorBlack)
            .font(.system(size: 16, weight: .regular, design: .rounded))
        }
      }
      .tint(.green)
      .padding(.horizontal, 10)
      .padding()
      .progressViewStyle(.automatic)
      
      Spacer()
      
      // MARK: - CENTER
      
      TabView {
        ForEach(manager.mockQuestion.indices, id: \.self) { index in
          VStack {
            Spacer()
            QuestionView(question: $manager.mockQuestion[index])
              .padding(.horizontal, 30)
            Spacer()
          }
        }
      }
      .tabViewStyle(.page)
    }
  }
}

// MARK: PREVIEW
#Preview {
  SurveyView()
}
