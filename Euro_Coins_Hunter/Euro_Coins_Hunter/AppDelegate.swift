//
//  AppDelegate.swift
//  Euro_Coins_Hunter
//
//  Created by Stanislav Cherkasov on 3/16/19.
//  Copyright © 2019 Stanislav Cherkasov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
  {
    window = UIWindow.init(frame: UIScreen.main.bounds)
    
    let mainViewController = TestViewController.init()
    
    window?.rootViewController = mainViewController
    
    window?.makeKeyAndVisible()
 
    return true
  }
}

