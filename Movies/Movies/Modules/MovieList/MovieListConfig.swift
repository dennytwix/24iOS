//
//  MovieListConfig.swift
//  Movies
//
//  Created by Denys Shchigrov on 05/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import Foundation

let gateway = DefaultMovieListGateway(apiKey: "9386823c26c8a8aee1b3032320b5c4d3")
let model = MovieList(gateway: gateway)

