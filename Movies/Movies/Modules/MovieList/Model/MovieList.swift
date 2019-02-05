//
//  MovieList.swift
//  Movies
//
//  Created by Denys Shchigrov on 05/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

class MovieList {
  private let gateway: MovieListGateway

  weak var output: MovieListOutput?

  init(gateway: MovieListGateway) {
    self.gateway = gateway
  }
}

extension MovieList: MovieListInput {
  func loadData() {
    gateway.fetchItems(page: 0) { [weak self] result in
      switch result {
      case .failure(let error): self?.output?.didReceive(error: error)
      case .success(let response): self?.proceed(response: response)
      }
    }
  }

  private func proceed(response: MovieListResponse) {
    
  }
}
