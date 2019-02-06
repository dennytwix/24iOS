//
//  MovieListTests.swift
//  MoviesTests
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import XCTest
@testable import Movies

class MovieListTests: XCTestCase {
  var gateway: TestMovieListGateway!
  var model: MovieList!
  var output: TestMovieListModelOutput!

  override func setUp() {
    gateway = TestMovieListGateway()
    output = TestMovieListModelOutput()

    model = MovieList(gateway: gateway)
    model.output = output
  }

  override func tearDown() {
    model = nil
    gateway = nil
    output = nil
  }
}

// MARK: Load next page
extension MovieListTests {
  func test_loadNextPage_firstCall_page1() {
    model.loadNextPage()

    XCTAssertEqual(gateway.page, 1)
  }

  func test_loadNextPage_noCompletionSecondCall_doesNothing() {
    model.loadNextPage()
    gateway.reset()

    model.loadNextPage()

    XCTAssertNil(gateway.page)
  }

  func test_loadNextPage_completionSecondCall_page2() {
    model.loadNextPage()
    gateway.success(response: pageResponse1)

    model.loadNextPage()

    XCTAssertEqual(gateway.page, 2)
  }

  func test_loadNextPage_page1_updatesItems() {
    model.loadNextPage()
    gateway.success(response: pageResponse1)

    XCTAssertEqual(model.movieListItems, pageResponse1.results)
  }

  func test_loadNextPage_page2_updatesItems() {
    model.loadNextPage()
    gateway.success(response: pageResponse1)

    model.loadNextPage()
    gateway.success(response: pageResponse2)

    let expectedItems = pageResponse1.results + pageResponse2.results
    XCTAssertEqual(model.movieListItems, expectedItems)

    XCTAssertTrue(output.didReloadDataCalled)
  }

  func test_loadNextPage_firstPageSuccess_reloadsData() {
    model.loadNextPage()
    gateway.success(response: pageResponse1)

    XCTAssertTrue(output.didReloadDataCalled)
  }

  func test_loadNextPage_secondPage_passesNewIndexes() {
    model.loadNextPage()
    gateway.success(response: pageResponse1)

    model.loadNextPage()
    gateway.success(response: pageResponse2)

    let expectedIndexes = [2]
    XCTAssertEqual(output.receivedIndexes, expectedIndexes)

    XCTAssertTrue(output.didReloadDataCalled)
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

  func test_loadNextPage_error_passedToOutput() {
    model.loadNextPage()
    let error = TestError()

    gateway.error(error)

    XCTAssertEqual(output.receivedError, error)
  }

  func test_loadNextPage_error_loadsFirstPageAgain() {
    model.loadNextPage()
    let error = TestError()
    gateway.error(error)

    gateway.reset()
    model.loadNextPage()

    XCTAssertEqual(gateway.page, 1)
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

extension MovieListItem {
  static func createTestItem(id: Int) -> MovieListItem {
    return MovieListItem(id: id, title: "Item: \(id)")
  }
}
