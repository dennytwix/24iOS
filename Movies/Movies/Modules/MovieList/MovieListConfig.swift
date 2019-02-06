//
//  MovieListConfig.swift
//  Movies
//
//  Created by Denys Shchigrov on 05/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

class MovieListConfig {
  var gateway: DefaultMovieListGateway!
  var model: MovieList!
  var controller: MovieListController!

  func setupDependencies(vc: MovieListViewController) {
    gateway = DefaultMovieListGateway(apiKey: "9386823c26c8a8aee1b3032320b5c4d3")
    model = MovieList(gateway: gateway)
    controller = MovieListController()

    model.output = controller

    controller.itemsStorage = model
    controller.model = model
    controller.view = vc

    vc.output = controller
    vc.tableViewItemsSource = controller
  }
}


