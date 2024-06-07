//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct CircleGroupView: View {
  // MARK: - PROPERTY
  
  @State var ShapeColor: Color
  @State var ShapeOpacity: Double
  @State private var isAnimating: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
        .frame(width: 280, height: 280, alignment: .center)
      Circle()
        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
        .frame(width: 280, height: 280, alignment: .center)
    } //: ZSTACK
  }
}

// MARK: - PREVIEW

struct CircleGroupView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color(.colorWhite)
        .ignoresSafeArea(.all, edges: .all)
      
      CircleGroupView(ShapeColor: .colorBlue, ShapeOpacity: 0.2)
    }
  }
}
