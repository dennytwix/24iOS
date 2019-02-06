//
//  MovieListDisplayItemSource.swift
//  Movies
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

protocol MovieListDisplayItemSource {
  var displayItems: [MovieListDisplayItem] { get }
}
