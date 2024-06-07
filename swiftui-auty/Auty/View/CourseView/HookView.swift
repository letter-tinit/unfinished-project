//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct HookView: View {
  // MARK: - PROPERTY
  private var width = UIScreen.main.bounds.width
  
  // MARK: - BODY
  
  var body: some View {
    ZStack(alignment: .bottom) {
      RoundedRectangle(cornerRadius: 20)
        .frame(width: width - 40, height: 160)
        .foregroundColor(.colorBlue)
      
      
      HStack {
        Spacer(minLength: 40)
        
        VStack(alignment: .leading, spacing: 20) {
          Text("Xem hôm nay chúng ta học gì nào?")
            .font(.system(size: 20))
            .fontWeight(.semibold)
            .fontDesign(.rounded)
            .foregroundStyle(.colorWhite)
          
          Button {
            
          } label: {
            ZStack {
              Capsule()
                .foregroundStyle(.colorWhite)
                .frame(width: 100, height: 30)
              
              Text("Khám phá")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .foregroundStyle(.colorBlue)
            }
          }
        }
        .padding(.top, 30)
        
        Spacer()
        Image("doctor")
          .resizable()
          .scaledToFit()
          .frame(width: 130)
      }
    }
    .frame(width: 350, height: 190, alignment: .center)
  }
}

// MARK: PREVIEW
#Preview {
  HookView()
}
