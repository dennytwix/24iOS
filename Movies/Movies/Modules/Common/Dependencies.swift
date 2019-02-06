//
//  Dependencies.swift
//  Movies
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

class Dependencies {
  static let shared = Dependencies()

  // MARK: - Configs
  private let movieListConfig = MovieListConfig()

  func setup(vc: MovieListViewController) {
    movieListConfig.setupDependencies(vc: vc)
  }
}
