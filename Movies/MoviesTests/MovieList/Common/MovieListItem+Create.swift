//
//  MovieListItem+Create.swift
//  MoviesTests
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation
@testable import Movies

extension MovieListItem {
  static func createTestItem(id: Int) -> MovieListItem {
    return MovieListItem(id: id, title: "\(id)", relativeImageURL: "")
  }
}
