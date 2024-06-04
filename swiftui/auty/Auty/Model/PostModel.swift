//
//  PostModel.swift
//  Auty
//
//  Created by Treasure Letter on 01/04/2024.
//

import SwiftUI

// MARK: - POST MODEL

struct Post: Identifiable {
  var id = UUID()
  var title: String
  var image: String
  var rating: Int
}
