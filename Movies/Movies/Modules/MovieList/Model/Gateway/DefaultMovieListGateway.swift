//
//  DefaultMovieListGateway.swift
//  Movies
//
//  Created by Denys Shchigrov on 05/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation
import Alamofire

class DefaultMovieListGateway: MovieListGateway {
  private let apiKey: String
  
  init(apiKey: String) {
    self.apiKey = apiKey
  }

  func fetchItems(page: Int, completion: @escaping MovieListCompletion) {
    AF.request("https://api.themoviedb.org/3/movie/popular", parameters: parameters).responseDecodable { (response: DataResponse<MovieListResponse>) in
      completion(response.result)
    }
  }

  var parameters: Parameters {
    return ["api_key": apiKey]
  }
}
