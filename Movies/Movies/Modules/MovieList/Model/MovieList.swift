//
//  MovieList.swift
//   Movies
//
//  Created by Denys Shchigrov on 05/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

class MovieList: MovieListStorage {
  private let gateway: MovieListGateway

  private var lastLoadedPage: Int?
  private var totalPages: Int?
  private var isLoading = false

  weak var output: MovieListOutput?
  private(set) var movieListItems: [MovieListItem] = []

  init(gateway: MovieListGateway) {
    self.gateway = gateway
  }
}

extension MovieList: MovieListInput {
  func reset() {
    guard !isLoading else { return }

    lastLoadedPage = nil
    totalPages = nil
    movieListItems = []
  }

  func loadNextPage() {
    guard hasMoreItemsToLoad else { return }
    guard !isLoading else { return }

    fetchItems()
  }

  private var hasMoreItemsToLoad: Bool {
    guard let lastLoadedPage = lastLoadedPage, let totalPages = totalPages else { return true }

    return lastLoadedPage < totalPages
  }

  private func fetchItems() {
    isLoading = true

    gateway.fetchItems(page: nextPage) { [weak self] result in
      switch result {
      case .failure(let error): self?.proceed(error: error)
      case .success(let response): self?.proceed(response: response)
      }
    }
  }

  private var nextPage: Int {
    guard let lastLoadedPage = lastLoadedPage else { return 1 }
    return lastLoadedPage + 1
  }

  private func proceed(response: MovieListResponse) {
    lastLoadedPage = response.page
    totalPages = response.totalPages

    proceed(items: response.results)

    isLoading = false
  }

  private func proceed(items: [MovieListItem]) {
    movieListItems.append(contentsOf: items)
  }

  private func proceed(error: Error) {
    output?.didReceive(error: error)

    isLoading = false
  }
}
