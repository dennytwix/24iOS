//
//  MovieListTableViewCell.swift
//  Movies
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import UIKit
import Kingfisher

class MovieListTableViewCell: UITableViewCell {
  @IBOutlet weak var backgroundImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()

    backgroundImageView.kf.indicatorType = .activity
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    
    backgroundImageView.image = nil
    titleLabel.text = ""
  }

  func update(item: MovieListDisplayItem) {
    titleLabel.text = item.title
    guard let url = item.imageURL else { return }

    backgroundImageView.kf.setImage(with: url)
  }
}
