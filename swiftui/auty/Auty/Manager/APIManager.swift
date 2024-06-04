//
//  APIManager.swift
//  Auty
//
//  Created by Treasure Letter on 22/04/2024.
//

import Foundation
import Alamofire
import Combine

enum APIError: Error {
  case failedToGetData
  case badUrl
}

class APIManager {
  static let shared = APIManager()
  
  private init() {}
  
  func listAllCourse() -> AnyPublisher<[Course], Error> {
    guard let url = URL(string: APIConstants.Course.list) else {
      return Fail(error: APIError.badUrl).eraseToAnyPublisher()
    }
    
    return AF.request(url, method: .get)
      .publishDecodable(type: [Course].self)
      .tryMap { response in
        guard response.response?.statusCode == 200 else {
          if let statusCode = response.response?.statusCode {
            print("Unexpected status code: \(statusCode)")
          }
          throw APIError.failedToGetData
        }
        return try response.result.get()
      }
      .eraseToAnyPublisher()
  }
}
