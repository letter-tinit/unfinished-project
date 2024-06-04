//
//  QuizManager.swift
//  Auty
//
//  Created by Treasure Letter on 19/04/2024.
//

import Foundation
import Observation

@Observable class QuizManager {
  var canSubmit: Bool {
    get {
      return mockQuestion.filter({ $0.selection == nil}).isEmpty
    }
    
    set {
      
    }
  }
  
  var progress: Double {
    get {
      return Double(mockQuestion.filter({ $0.selection != nil}).count) / Double(mockQuestion.count)
    }
    
    set {
      
    }
  }
  
  var mockQuestion = [
    Question(title: "Trẻ có thường hay bị mất ngủ không?"),
    Question(title: "Trẻ có thường xuyên ở một mình không?"),
    Question(title: "Trẻ có thường ở một mình không?"),
//    Question(title: "Trẻ có thường ở một mình không?"),
  ]
}
