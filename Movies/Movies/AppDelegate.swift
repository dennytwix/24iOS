//
//  AppDelegate.swift
//  Movies
//
//  Created by Denys Shchigrov on 05/02/2019.
//  Copyright © 2019 dennytwix. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  private var dependencyContainer: DependencyContainer!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow()
    guard let window = window else { return false }

    dependencyContainer = DependencyContainer(window: window)
    dependencyContainer.setupInitialViewController()

    window.makeKeyAndVisible()

    return true
  }
}
