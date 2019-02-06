//
//  MovieListIO.swift
//  Movies
//
//  Created by Denys Shchigrov on 05/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

protocol MovieListInput: class {
  func reset()
  func loadNextPage()
}

protocol MovieListOutput: class {
  func didReceive(items: [MovieListItem])
  func didReceive(error: Error)
}
