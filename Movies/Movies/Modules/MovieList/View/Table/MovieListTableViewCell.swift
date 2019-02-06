//
//  MovieListTableViewCell.swift
//  Movies
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!

  override func prepareForReuse() {
    // TODO: Placeholder image
    backgroundImageView.image = nil
    titleLabel.text = ""
  }

  func update(item: MovieListDisplayItem) {
    titleLabel.text = item.title
  }
}
