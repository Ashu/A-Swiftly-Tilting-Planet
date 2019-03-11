//
//  AppDelegate.swift
//  Swift Meetup
//
//  Created by Caleb Wells on 2/25/19.
//  Copyright © 2019 Caleb Wells. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: MessageViewController())
        window?.makeKeyAndVisible()
        
        return true
    }
}
