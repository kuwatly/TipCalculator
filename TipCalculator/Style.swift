//
//  Style.swift
//  TipCalculator
//
//  Created by Iyad Kuwatly on 3/5/17.
//  Copyright © 2017 Iyad Kuwatly. All rights reserved.
//

import Foundation
import UIKit

struct Style{
    static let redColor = UIColor(red: 1, green: 0.10980392156862745, blue: 0.42745098039215684, alpha: 1)
    static let blueColor = UIColor(red: 0.69221994639999995, green: 0.88671361829999995, blue: 1, alpha: 1)
    // Default Colors
    static var styleBackgroundColor = blueColor
    static var styleSeparatorColor = redColor
    static var styleFontColor = UIColor.black
    
    static func themeLight(){
        styleBackgroundColor = blueColor
        styleSeparatorColor = redColor
        styleFontColor = UIColor.black
    }
    
    static func themeDark(){
        styleBackgroundColor = UIColor.darkGray
        styleSeparatorColor = blueColor
        styleFontColor = UIColor.white
    }
}
