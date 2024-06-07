//
//  Question.swift
//  Auty
//
//  Created by Treasure Letter on 19/04/2024.
//

import Foundation

struct Question {
  let id = UUID()
  let title: String
  let options: [String] = ["Không Thường Xuyên", "Thường Xuyên", "Rất Thường Xuyên"]
  var selection: String?
}
