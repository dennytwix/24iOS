//
//  MovieListDisplayItem.swift
//  Movies
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

struct MovieListDisplayItem {
  let imageURL: String
  let title: String
}

extension MovieListDisplayItem {
  init(item: MovieListItem) {
    title = item.title
    imageURL = item.imageURL
  }
}
