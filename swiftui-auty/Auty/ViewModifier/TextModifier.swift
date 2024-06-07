//
//  TextModifier.swift
//  Auty
//
//  Created by Treasure Letter on 02/04/2024.
//

import SwiftUI

struct PartitionTextModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundStyle(.yellow)
      .font(.system(size: 14, weight: .medium, design: .rounded))
  }
}

struct TextModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 14, weight: .medium, design: .rounded))
      .foregroundStyle(.colorBlue)
  }
}


