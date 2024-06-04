//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct HomeHeaderView: View {
  // MARK: - PROPERTY
  @State private var searchText = ""
  
  
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      Color.colorBlue
      
      VStack {
        HStack {
          Image("logo-white")
            .resizable()
            .scaledToFit()
            .frame(width: 35)
          
          Spacer()
          
          Text(Strings.HomeView.autyLearning.uppercased())
            .font(.system(size: 22, weight: .bold))
            .foregroundStyle(.colorWhite)
          
          Spacer()
          
          Button {
            // ACTION
          } label: {
            Image(systemName: "bell")
              .resizable()
              .badge(2)
              .scaledToFit()
              .frame(width: 30)
              .foregroundStyle(.colorWhite)
          }
          .overlay(alignment: .topTrailing) {
            Circle()
              .frame(width: 15, height: 15)
              .foregroundStyle(.red)
          }
        }
        .padding(.bottom)
        .padding(.horizontal)

        SearchView(searchText: $searchText)
          .padding(.horizontal)

      }
    }
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .shadow(color: .colorBlack.opacity(0.4) ,radius: 5, x: 2, y: 2)
    .frame(height: 180)
    .padding(.vertical)
  }
}

// MARK: PREVIEW
#Preview {
  HomeHeaderView()
}
