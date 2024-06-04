//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct SearchView: View {
  // MARK: - PROPERTY
  @Binding var searchText: String
  
  
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      Color.colorWhite
      
      HStack {
        TextField(
          "Search",
          text: $searchText,
          prompt: Text(Strings.HomeView.course)
            .foregroundStyle(.gray)
            .font(.system(size: 22, design: .rounded))
        )
        .padding()
        .foregroundStyle(.colorBlack)
        
        Spacer()
        
        Button {
          
        } label: {
          Image(systemName: "magnifyingglass")
            .foregroundStyle(.colorBlue)
        }
        
        ZStack {
          Color.yellow
          
          Image(systemName: "slider.horizontal.3")
            .fontWeight(.bold)
            .padding()
        }
        .frame(width: 60)
      }
      
    }
    .frame(height: 60)
    .foregroundStyle(.colorWhite)
    .font(.system(size: 22, design: .rounded))
    .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}

// MARK: PREVIEW
#Preview(traits: .fixedLayout(width: 375, height: 80)) {
  SearchView(searchText: .constant(""))
    .padding()
}
