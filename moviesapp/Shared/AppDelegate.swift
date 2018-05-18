//
//  AppDelegate.swift
//  moviesapp
//
//  Created by Emerson Batista on 5/4/18.
//  Copyright © 2018 Emerson Batista. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        configureAppearance()
        configureTabbarController(on: window)
        self.window = window
        
        window.makeKeyAndVisible()
        return true
    }
    
    private func configureTabbarController(on window: UIWindow) {
        let tabbarController = UITabBarController()
        setControllers(on: tabbarController)
        window.rootViewController = tabbarController
    }
    
    private func setControllers(on tabbarController: UITabBarController) {
        let controllers = createControllers()
        tabbarController.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
    }
    
    private func createControllers() -> [UIViewController] {
        let listMoviesVC = ListMoviesViewController()
        listMoviesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 0)
        
        return [listMoviesVC]
    }
    
    private func configureAppearance() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.barTintColor = UIColor(red: 247/255.0, green: 206/255.0, blue: 91/255.0, alpha: 1)
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.tintColor = UIColor.black
    }

}

