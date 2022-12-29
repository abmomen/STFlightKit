//
//  AppDelegate.swift
//  STFlightKit
//
//  Created by 20514535 on 12/20/2022.
//  Copyright (c) 2022 20514535. All rights reserved.
//

import UIKit
import FirebaseCore
import STCoreKit
import STFlightKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = NavigationController(rootViewController: FlightSearchVC.instantiate())
        
        return true
    }

}

