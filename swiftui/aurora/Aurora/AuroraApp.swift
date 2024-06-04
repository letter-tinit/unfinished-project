//
//  AuroraApp.swift
//  Aurora
//
//  Created by Treasure Letter on 07/05/2024.
//

import SwiftUI

@main
struct AuroraApp: App {
  @AppStorage("loading") var loading: Bool = true
  
  var body: some Scene {
    WindowGroup {
      TabBarView()
    }
  }
}
