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
    // TODO: Show error
  }
}
