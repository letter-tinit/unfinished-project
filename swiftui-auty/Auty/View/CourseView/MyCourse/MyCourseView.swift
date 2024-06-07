//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct MyCourseView: View {
  // MARK: - PROPERTY
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      Spacer()
      HookView()
        .padding(.horizontal, 90)
        .shadow(color: .colorBlack.opacity(0.4), radius: 7)
      
      // MARK: - COURSE BUTTON
      Spacer()
      VStack(alignment: .leading) {
        HStack {
          Text(Strings.CourseView.allMyCourse)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundStyle(.colorBlue)
            .shadow(color: .colorBlack.opacity(0.4), radius: 9)
          
          Spacer()
        }
        
        ScrollView(.horizontal) {
          HStack {
            MyCourseButtonView()
            MyCourseButtonView()
            MyCourseButtonView()
          }
        }
      }
      .padding(.horizontal)
      
      Spacer()
    }
    .frame(alignment: .top)
  }
}

// MARK: PREVIEW
#Preview {
  MyCourseView()
}
