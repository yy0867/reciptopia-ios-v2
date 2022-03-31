//
//  AppDelegate.swift
//  Reciptopia
//
//  Created by 김세영 on 2022/03/29.
//

import UIKit
import Reciptopia_iOS


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewModel = PictureIngredientViewModel()
        let mainVC = PictureIngredientNavigationController(viewModel: viewModel)
        
        window?.makeKeyAndVisible()
        window?.rootViewController = mainVC
        
        return true
    }
}

