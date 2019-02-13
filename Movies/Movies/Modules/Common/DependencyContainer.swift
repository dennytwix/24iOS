//
//  Dependencies.swift
//  Movies
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import UIKit

class DependencyContainer {
  private let window: UIWindow

  // MARK: - Configs
  private let movieListConfig = MovieListConfig()

  init(window: UIWindow) {
    self.window = window
  }

  func setupInitialViewController() {
    let vc = movieListConfig.createViewController()
    let navigationController = UINavigationController(rootViewController: vc)

    window.rootViewController = navigationController
  }
}
