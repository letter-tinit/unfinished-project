//
//  CourseViewModel.swift
//  Auty
//
//  Created by Treasure Letter on 22/04/2024.
//

import Foundation
import Combine

@Observable
class CourseViewModel {
  var courses = [Course]()
  
  var cancellables: Set<AnyCancellable> = []
  
  func listAllCourses() {
    APIManager.shared.listAllCourse()
      .sink { completion in
        switch completion {
        case .finished:
          break
        case .failure(let error):
          print(error.localizedDescription)
        }
      } receiveValue: { result in
        print(result)
        self.courses = result
      }
      .store(in: &cancellables)
  }
  
  deinit {
    cancellables.forEach { $0.cancel() }
  }
}

