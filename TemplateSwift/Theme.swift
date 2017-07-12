//
//  Theme.swift
//  TemplateSwift
//
//  Created by Macbook Solution on 7/11/17.
//  Copyright © 2017 lvmtam. All rights reserved.
//

import UIKit


let ThemeKey = "com.hbb.TemplateSwift.Key.Theme"

struct Theme {
    
    static let availableThemes = ["default", "blue", "yellow"]
    static var color = Color.blue
    
    static func loadTheme() {
        if let theme = UserDefaults.standard.object(forKey: ThemeKey) as? String, availableThemes.contains(theme) {
            switch theme {
                case "blue": loadBlueTheme()
                case "yellow": loadYellowTheme()
                default: loadDefaultTheme()
            }
        } else {
            UserDefaults.standard.set("blue", forKey: ThemeKey)
            loadDefaultTheme()
        }
    }
    
    
    static private func loadDefaultTheme() {
        color = Color()
        color.background = UIColor.brown
        color.button = UIColor.brown
    }
    
    static private func loadBlueTheme() {
        color = Color.blue
    }
    
    static private func loadYellowTheme() {
        // FIXME: do as loadBlueTheme()
    }
}
