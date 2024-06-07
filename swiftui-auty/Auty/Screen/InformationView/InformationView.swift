//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct InformationView: View {
  // MARK: - PROPERTY
  @AppStorage("information") var isInformationViewActive: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    Text("INFORMATION")
//      .onAppear {
//        self.isInformationViewActive = false
//      }
  }
}

// MARK: PREVIEW
#Preview {
  InformationView()
}
