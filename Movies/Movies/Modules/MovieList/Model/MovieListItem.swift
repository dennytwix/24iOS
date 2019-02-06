//
//  MovieListItem.swift
//  Movies
//
//  Created by Denys Shchigrov on 05/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

fileprivate enum Constants {
  static let baseImageURL = URL(string: "https://image.tmdb.org/t/p/w500/")
}

struct MovieListItem: Decodable, Equatable {
  let id: Int
  let title: String
  private let relativeImageURL: String?

  init(id: Int, title: String, relativeImageURL: String) {
    self.id = id
    self.title = title
    self.relativeImageURL = relativeImageURL
  }

  var imageURL: URL? {
    guard let relativeImageURL = relativeImageURL else { return nil }

    let urlWithoutSlash = String(relativeImageURL.dropFirst())
    return URL(string: urlWithoutSlash, relativeTo: Constants.baseImageURL)
  }

  enum CodingKeys: String, CodingKey {
    case id
    case title
    case relativeImageURL = "backdrop_path"
  }
}
