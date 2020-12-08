//
//  AppDelegate.swift
//  Fora Soft (Test Task)
//
//  Created by Дмитрий Ахмеров on 08.12.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationViewController = UINavigationController(rootViewController: MainViewController())
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
        
        return true
    }
    
}

