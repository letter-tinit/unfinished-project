//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct HomeView: View {
  // MARK: - PROPERTY
  
  
  // MARK: - BODY
  
  var body: some View {
    ScrollView {
      VStack {
        // MARK: - HEADER
        HomeHeaderView()
        // MARK: - CENTER
        VStack(spacing: 40) {
          // MARK: - SECTION 1
          VStack {
            HStack {
              Text(Strings.HomeView.courseCategory)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundStyle(.colorBlue)
              
              Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
              HStack(alignment: .center, spacing: 20) {
                CategoryButtonView(icon: "book", title: Strings.HomeView.info)
                CategoryButtonView(icon: "edit", title: Strings.HomeView.survey)
                CategoryButtonView(icon: "text", title: Strings.HomeView.progress)
                CategoryButtonView(icon: "bulb", title: Strings.HomeView.tryOut)
              }
            }//: SCROLLVIEW
          }//: HSTACK
           // MARK: - SECTION 2
          VStack {
            HStack {
              Text(Strings.HomeView.recommend)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundStyle(.colorBlue)
              
              Spacer()
            }//:HSTACK
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                RecommendButtonView(post: postDatas[0])
                RecommendButtonView(post: postDatas[1])
              }
              .padding(7)
              
            }
          }//: SECTION 2
          VStack {
            HStack {
              Text(Strings.HomeView.topCourse)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundStyle(.colorBlue)
              
              Spacer()
            }//:HSTACK
            ScrollView(.horizontal, showsIndicators: false) {
              HStack(spacing: 20) {
                CourseButtonView()
                CourseButtonView()
              }
              .padding(7)
            }
          }//: SECTION 3
          Spacer(minLength: 20)
          // MARK: - SECTION 3
        }//:CENTER
        Spacer(minLength: 80)
      }//:VSTACK
      .padding(.horizontal)
    }//: SCROLLVIEW
  }
}

// MARK: PREVIEW
#Preview {
  HomeView()
}
