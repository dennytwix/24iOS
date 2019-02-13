//
//  UIViewController+Storyboard.swift
//  Movies
//
//  Created by Denys Shchigrov on 13/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import UIKit

protocol StoryboardCreatable: class { }

extension UIViewController: StoryboardCreatable { }

extension StoryboardCreatable where Self: UIViewController {
  static func createFromStoryboard() -> Self {
    return UIStoryboard(name: "\(self)", bundle: nil)
      .instantiateInitialViewController() as! Self
  }
}
