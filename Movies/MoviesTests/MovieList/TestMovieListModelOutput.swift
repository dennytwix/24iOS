//
//  TestMovieListModelOutput.swift
//  MoviesTests
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation
@testable import Movies

class TestMovieListModelOutput: MovieListOutput {
  var didReloadDataCalled = false
  func didReloadData() {
    didReloadDataCalled = true
  }

  var receivedIndexes: [Int]?
  func didReceiveItems(indexes: [Int]) {
    receivedIndexes = indexes
  }

  var receivedError: TestError?
  func didReceive(error: Error) {
    receivedError = error as? TestError
  }
}
