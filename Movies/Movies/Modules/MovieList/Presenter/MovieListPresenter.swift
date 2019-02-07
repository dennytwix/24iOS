//
//  MovieListPresenter.swift
//  Movies
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

class MovieListPresenter: MovieListDisplayItemSource {
  weak var model: MovieListInput!
  weak var itemsStorage: MovieListStorage!
  weak var view: MovieListViewInput!

  private(set) var displayItems: [MovieListDisplayItem] = []

  private func refreshDisplayItems() {
    displayItems = itemsStorage.movieListItems.map { MovieListDisplayItem(item: $0) }
  }
}

extension MovieListPresenter: MovieListViewOutput {
  func viewDidLoad() {
    model.loadNextPage()
  }

  func willDisplayItem(at indexPath: IndexPath) {
    loadNextPageIfNeeded(index: indexPath.row)
  }

  private func loadNextPageIfNeeded(index: Int) {
    let threshold = 4
    let itemsLeftAfterThisIndex = itemsStorage.movieListItems.count - index

    guard itemsLeftAfterThisIndex < threshold else { return }

    model.loadNextPage()
  }

  func refresh() {
    model.reset()
    model.loadNextPage()
  }
}

extension MovieListPresenter: MovieListOutput {
  func didReloadData() {
    refreshDisplayItems()
    view.reloadData()
  }

  func didReceiveItems(indexes: [Int]) {
    refreshDisplayItems()
    
    let indexPaths = indexes.map { IndexPath(row: $0, section: 0) }
    view.insetrtItems(at: indexPaths)
  }

  func didReceive(error: Error) {
    print(error.localizedDescription)
    // TODO: Pass error to output
  }
}
