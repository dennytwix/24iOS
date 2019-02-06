//
//  MovieListViewController.swift
//  Movies
//
//  Created by Denys Shchigrov on 06/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import UIKit

class MovieListViewController: UITableViewController {
  var tableViewItemsSource: MovieListDisplayItemSource!
  var output: MovieListViewOutput?

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    Dependencies.shared.setup(vc: self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.estimatedRowHeight = 145

    output?.viewDidLoad()
  }
}

extension MovieListViewController: MovieListViewInput {
  func reloadData() {
    tableView.reloadData()
  }

  func insetrtItems(at indexPaths: [IndexPath]) {
    tableView.beginUpdates()
    tableView.insertRows(at: indexPaths, with: .automatic)
    tableView.endUpdates()
  }
}

extension MovieListViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableViewItemsSource.displayItems.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "\(MovieListTableViewCell.self)", for: indexPath) as! MovieListTableViewCell
    let item = tableViewItemsSource.displayItems[indexPath.row]

    cell.update(item: item)

    return cell
  }
}
