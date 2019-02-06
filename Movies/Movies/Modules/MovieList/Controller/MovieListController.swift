//
//  MovieListController.swift
//  Movies
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

class MovieListController {
  weak var model: MovieListInput!
  weak var itemsStorage: MovieListStorage!
  weak var view: MovieListViewInput!
}

extension MovieListController: MovieListViewOutput {
  func viewDidLoad() {
    model.loadNextPage()
  }

  func willDisplayItem(at indexPath: IndexPath) {
    loadNextPageIfNeeded(index: indexPath.row)
  }

  private func loadNextPageIfNeeded(index: Int) {
    let threshold = 4
    let itemsLeft = itemsStorage.movieListItems.count - index

    guard itemsLeft < threshold else { return }

    model.loadNextPage()
  }

  func refresh() {
    model.reset()
    model.loadNextPage()
  }
}

extension MovieListController: MovieListOutput {
  func didReloadData() {
    view.reloadData()
  }

  func didReceiveItems(indexes: [Int]) {
    let indexPaths = indexes.map { IndexPath(row: $0, section: 0) }
    view.insetrtItems(at: indexPaths)
  }

  func didReceive(error: Error) {
    print(error.localizedDescription)
    // TODO: Show error
  }
}

extension MovieListController: MovieListDisplayItemSource {
  var displayItems: [MovieListDisplayItem] {
    return itemsStorage.movieListItems.map { MovieListDisplayItem(item: $0) }
  }
}
