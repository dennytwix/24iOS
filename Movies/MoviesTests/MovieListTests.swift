//
//  MovieListTests.swift
//  MoviesTests
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import XCTest
import Alamofire
@testable import Movies

class MovieListTests: XCTestCase {
  var gateway: TestMovieListGateway!
  var model: MovieList!

  override func setUp() {
    gateway = TestMovieListGateway()
    model = MovieList(gateway: gateway)
  }

  override func tearDown() {
    model = nil
    gateway = nil
  }
}

// MARK: Load next page
extension MovieListTests {
  func test_loadNextPage_firstCall_page1() {
    model.loadNextPage()

    XCTAssertEqual(gateway.page, 1)
  }

  func test_loadNextPage_noCompletionSecondCall_page1() {
    model.loadNextPage()
    model.loadNextPage()

    XCTAssertEqual(gateway.page, 1)
  }

  func test_loadNextPage_completionSecondCall_page2() {
    model.loadNextPage()
    gateway.success(response: pageResponse1)

    model.loadNextPage()

    XCTAssertEqual(gateway.page, 2)
  }

  func test_loadNextPage_success_changesItems() {
    model.loadNextPage()
    gateway.success(response: pageResponse1)

    XCTAssertEqual(model.movieListItems, pageResponse1.results)
  }

  func test_loadNextPage_latestPage_doesNothing() {
    model.loadNextPage()
    gateway.success(response: pageResponse1)

    model.loadNextPage()
    gateway.success(response: pageResponse2)

    gateway.reset()
    model.loadNextPage()

    XCTAssertNil(gateway.page)
  }
}

// MARK: Reset
extension MovieListTests {
  func test_reset_loadsPage1() {
    model.loadNextPage()
    gateway.success(response: pageResponse1)

    gateway.reset()
    model.reset()

    model.loadNextPage()

    XCTAssertEqual(gateway.page, 1)
  }

  func test_reset_cleansStorage() {
    model.loadNextPage()
    gateway.success(response: pageResponse1)

    model.reset()

    XCTAssertEqual(model.movieListItems, [])
  }
}

// MARK: Helpers
extension MovieListTests {
  var pageResponse1: MovieListResponse {
    let results = (0...1).map { MovieListItem.createTestItem(id: $0) }

    return MovieListResponse(page: 1, totalPages: 2, results: results)
  }

  var pageResponse2: MovieListResponse {
    let results = [MovieListItem.createTestItem(id: 2)]

    return MovieListResponse(page: 2, totalPages: 2, results: results)
  }
}

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
}

extension MovieListItem {
  static func createTestItem(id: Int) -> MovieListItem {
    return MovieListItem(id: id, title: "Item: \(id)")
  }
}
