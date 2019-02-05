//
//  MovieListGateway.swift
//  Movies
//
//  Created by Denys Shchigrov on 05/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation
import Alamofire

typealias MovieListCompletion = (Result<MovieListResponse>) -> Void

protocol MovieListGateway {
  func fetchItems(page: Int, completion: @escaping MovieListCompletion)
}
