//
//  MovieListViewOutput.swift
//  Movies
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

protocol MovieListViewInput: class {
  func reloadData()
  func insetrtItems(at indexPaths: [IndexPath])
}

protocol MovieListViewOutput: class {
  func viewDidLoad()
  func willDisplayItem(at indexPath: IndexPath)
  func refresh()
}
