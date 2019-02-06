//
//  AppDelegate.swift
//  PhotoViewer
//
//  Created by Ohanna Perre on 01/02/2019.
//  Copyright © 2019 Ohanna Perre. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().prefersLargeTitles = true

        let photoListView = PhotoListBuilder.makePhotoListView()
        let navigationController = UINavigationController(rootViewController: photoListView)
        navigationController.navigationBar.tintColor = .black
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }
}
