//
//  UITableView+Convenience.swift
//  Movies
//
//  Created by Denys Shchigrov on 08/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import UIKit

extension UITableView {
  func register<Cell: UITableViewCell>(_ type: Cell.Type) {
    register(type, forCellReuseIdentifier: "\(type)")
  }

  func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
    return dequeueReusableCell(withIdentifier: "\(Cell.self)", for: indexPath) as! Cell
  }
}
