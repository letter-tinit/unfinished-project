//
//  ContentView.swift
//  Aurora
//
//  Created by Treasure Letter on 07/05/2024.
//

import SwiftUI
import Lottie

struct ContentView: View {
  var loading: Bool = true
  
  var body: some View {
    ZStack {
      if loading {
        SplashView()
      } else {
        HomeView()
      }
    }
  }
}

#Preview {
  ContentView()
}
