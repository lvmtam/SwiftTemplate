//
//  AppDelegate.swift
//  TemplateSwift
//
//  Created by Macbook Solution on 7/11/17.
//  Copyright © 2017 lvmtam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Theme.loadTheme()
        
        Font.h1
        
        Color.blue
        
        return true
    }


}

