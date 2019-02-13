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

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.estimatedRowHeight = 180
    setupRefreshControl()

    output?.viewDidLoad()
  }

  private func setupRefreshControl() {
    refreshControl = UIRefreshControl()
    refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
  }

  @objc func refresh() {
    output?.refresh()
  }
}

extension MovieListViewController: MovieListViewInput {
  func reloadData() {
    tableView.reloadData()
    refreshControl?.endRefreshing()
  }

  func insetrtItems(at indexPaths: [IndexPath]) {
    tableView.beginUpdates()
    tableView.insertRows(at: indexPaths, with: .none)
    tableView.endUpdates()
  }
}

// MARK: - UITableViewDataSource
extension MovieListViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableViewItemsSource.displayItems.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(for: indexPath) as MovieListTableViewCell
    let item = tableViewItemsSource.displayItems[indexPath.row]

    cell.update(item: item)

    return cell
  }
}

// MARK: - UITableViewDelegate
extension MovieListViewController {
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    output?.willDisplayItem(at: indexPath)
  }
}
