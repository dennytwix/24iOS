//
//  MovieListConfig.swift
//  Movies
//
//  Created by Denys Shchigrov on 05/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import UIKit

class MovieListConfig {
  var gateway: DefaultMovieListGateway!
  var model: MovieList!
  var presenter: MovieListPresenter!

  func createViewController() -> MovieListViewController {
    let vc = UIStoryboard(name: "\(MovieListViewController.self)", bundle: nil).instantiateInitialViewController() as! MovieListViewController
    setupDependencies(vc: vc)

    return vc
  }

  private func setupDependencies(vc: MovieListViewController) {
    gateway = DefaultMovieListGateway(apiKey: "9386823c26c8a8aee1b3032320b5c4d3")
    model = MovieList(gateway: gateway)
    presenter = MovieListPresenter()

    model.output = presenter

    presenter.itemsStorage = model
    presenter.model = model
    presenter.view = vc

    vc.output = presenter
    vc.tableViewItemsSource = presenter
  }
}
