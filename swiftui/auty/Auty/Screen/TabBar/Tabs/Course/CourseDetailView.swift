//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct CourseDetailView: View {
  // MARK: - PROPERTY
  @State private var isRotated = false
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      if isRotated {
        Color.black
          .ignoresSafeArea(.all)
      }
      
      GeometryReader {
        let size = $0.size
        let safeArea = $0.safeAreaInsets
        
        VideoPlayerView(size: size, safeArea: safeArea, isRotate: $isRotated)
          .ignoresSafeArea(.all)
      }
    }
  }
}

// MARK: PREVIEW
#Preview {
  CourseDetailView()
}
