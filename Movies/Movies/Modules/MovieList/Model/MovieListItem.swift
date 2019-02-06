//
//  MovieListItem.swift
//  Movies
//
//  Created by Denys Shchigrov on 05/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

struct MovieListItem: Decodable, Equatable {
  let id: Int
  let title: String
  let imageURL: String

  enum CodingKeys: String, CodingKey {
    case id
    case title
    case imageURL = "poster_path"
  }
}
