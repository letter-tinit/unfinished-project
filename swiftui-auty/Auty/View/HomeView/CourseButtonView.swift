//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct CourseButtonView: View {
  // MARK: - PROPERTY
  
  
  @State private var isAnimating: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      Color.colorWhite
      
      VStack(alignment: .leading, spacing: 10) {
        Image("course-01")
          .resizable()
          .frame(width: 250, height: 180)
        
        VStack(alignment: .leading, spacing: 15) {
          Text("3 Paket Soal Try Out SMA IPA")
            .font(.system(size: 18, design: .rounded))
          
          HStack {
            Text(Strings.HomeView.price + " " + "350.000")
              .font(.system(size: 16, design: .rounded))
              .foregroundStyle(.red)
              .strikethrough()
            
            Text("250.000")
              .font(.system(size: 16, design: .rounded))
              .foregroundStyle(.colorBlack)
          }
          
          HStack {
            RatingView(rating: 4)
            
            Text("(4)")
          }
          
          Spacer()
        }
        .padding(.horizontal)
      }
    }
    .clipShape(RoundedRectangle(cornerRadius: 25))
    .frame(width: 250, height: 300)
//    .shadow(color: .colorBlack.opacity(0.4) ,radius: 5, x: 2, y: 2)
    .shadow(color: .colorBlack, radius: 2, x: 1, y: 1)
    .padding(6)
    .overlay(alignment: .bottomTrailing) {
      Button {
        
      } label: {
        ZStack {
          Group {
            Circle()
              .opacity(self.isAnimating ? 0.2 : 0)
              .scaleEffect(self.isAnimating ? 1 : 0)
              .frame(width: 40, height: 40, alignment: .center)
            Circle()
              .opacity(self.isAnimating ? 0.15 : 0)
              .scaleEffect(self.isAnimating ? 1 : 0)
              .frame(width: 50, height: 50, alignment: .center)
          }
          .animation(
            .easeInOut(duration: 2).repeatForever(autoreverses: true),
            value: isAnimating
          )
          
          Image(systemName: "plus.circle.fill")
            .resizable()
            .scaledToFit()
            .background(Circle().fill(Color("ColorBase")))
            .frame(width: 30, height: 30, alignment: .center)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
      }
      .onAppear {
        self.isAnimating.toggle()
      }
    }
  }
}
// MARK: PREVIEW
#Preview {
  CourseButtonView()
    .padding()
}
