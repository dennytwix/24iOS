//
//  MovieListControllerTests.swift
//  MoviesTests
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import XCTest
@testable import Movies

class MovieListControllerTests: XCTestCase {
  var controller: MovieListController!

  override func setUp() {
    controller = MovieListController()
  }

  override func tearDown() {
    controller = nil
  }
}
