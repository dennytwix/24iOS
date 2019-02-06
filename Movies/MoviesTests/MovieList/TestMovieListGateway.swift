//
//  TestMovieListGateway.swift
//  MoviesTests
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation
import Alamofire
@testable import Movies

class TestMovieListGateway: MovieListGateway {
  var page: Int?
  var completion: MovieListCompletion?

  func reset() {
    page = nil
    completion = nil
  }

  func fetchItems(page: Int, completion: @escaping MovieListCompletion) {
    self.page = page
    self.completion = completion
  }

  func success(response: MovieListResponse) {
    let result = Result.success(response)
    completion?(result)
  }

  func error(_ error: TestError) {
    let result = Result<MovieListResponse>.failure(error)
    completion?(result)
  }
}
