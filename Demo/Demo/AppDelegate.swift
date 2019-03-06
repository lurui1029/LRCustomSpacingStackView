//
//  AppDelegate.swift
//  Demo
//
//  Created by LuRui on 2019/2/28.
//  Copyright © 2019 Lu Rui. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ViewController()) 
        window?.makeKeyAndVisible()
        
        return true
    }
}

