//
//  FontBook.swift
//  FontPattern
//
//  Created by Macbook Solution on 7/5/17.
//  Copyright © 2017 Macbook Solution. All rights reserved.
//

import UIKit

struct Font {
    
    static let family = "Hueviewln"
    
    static let header = Font.size(of: 16)
    static let body   = Font.size(of: 11)
    static let h1     = Font.size(of: 18)
    static let h2     = Font.size(of: 16)
    static let h3     = Font.size(of: 14)
    static let h4     = Font.size(of: 12)
    static let h5     = Font.size(of: 11)
    
    static func size(of size: CGFloat) -> UIFont {
        return UIFont(name: family, size: size) ?? UIFont.systemFont(ofSize:size)
    }
}

/*** USAGE ***/
/*
Font.header
Font.body
Font.h1
Font.h2
Font.h3
Font.h4
Font.h5
Font.size(of: 12)
 */
