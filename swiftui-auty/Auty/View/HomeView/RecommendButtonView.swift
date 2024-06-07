//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct RecommendButtonView: View {
  // MARK: - PROPERTY
  var post: Post = postDatas[0]
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      Color.colorWhite
      HStack {
        Image(post.image)
          .resizable()
          .frame(width: 100, height: 100)
          .scaledToFit()
        
        VStack {
          Spacer()
          Text(post.title)
            .font(.system(size: 18, design: .rounded))
            .foregroundStyle(.gray)
          Spacer()
          
          HStack(alignment: .center) {
            RatingView(rating: post.rating)
            
            Text("(\(post.rating))")
              .font(.system(size: 18, design: .rounded))
              .foregroundStyle(.gray)
            
            Spacer()
            
            NavigationLink {
              EmptyView()
            } label: {
              Image(systemName: "chevron.right")
                .foregroundStyle(.colorBlack)
            }
          }
          Spacer()
        }
        Spacer()
      }
    }
    .clipShape(RoundedRectangle(cornerRadius: 10))
    .shadow(color: .colorBlack, radius: 2, x: 1, y: 1)
    .frame(width: 310, height: 100)
    .padding(5)
  }
}

// MARK: PREVIEW
#Preview(traits: .fixedLayout(width: 300, height: 100)) {
  RecommendButtonView()
    .padding()
}
