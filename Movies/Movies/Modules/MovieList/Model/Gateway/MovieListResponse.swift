//
//  MovieListResponse.swift
//  Movies
//
//  Created by Denys Shchigrov on 05/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

struct MovieListResponse: Decodable {
  let page: Int
  let totalPages: Int
  let results: [MovieListItem]

  enum CodingKeys: String, CodingKey {
    case page
    case results
    case totalPages = "total_pages"
  }
}
