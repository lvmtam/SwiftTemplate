//
//  Color.swift
//  TemplateSwift
//
//  Created by Macbook Solution on 7/11/17.
//  Copyright © 2017 lvmtam. All rights reserved.
//

import UIKit

struct Color {
    
    var background: UIColor = UIColor.black
    var button: UIColor = UIColor.brown
    
    static var blue: Color {
        var color = Color()
        color.background = UIColor.green
        color.button = UIColor.green
        return color
    }
    
}
