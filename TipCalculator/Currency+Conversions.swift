//
//  Currency+Conversions.swift
//  TipCalculator
//
//  Created by Iyad Kuwatly on 3/4/17.
//  Copyright © 2017 Iyad Kuwatly. All rights reserved.
//
// code referenced from: http://stackoverflow.com/questions/35537022/uitextfield-to-input-money-amount


import Foundation
import UIKit


extension NumberFormatter {
    convenience init(numberStyle: NumberFormatter.Style) {
        self.init()
        self.numberStyle = numberStyle
    }
}
struct Formatter {
    static let decimal = NumberFormatter(numberStyle: .decimal)
}
extension UITextField {
    var string: String { return text ?? "" }
}

extension String {
    private static var digitsPattern = UnicodeScalar("0")..."9"
    var digits: String {
        return unicodeScalars.filter { String.digitsPattern ~= $0 }.string
    }
    var integer: Int { return Int(self) ?? 0 }
}

extension Sequence where Iterator.Element == UnicodeScalar {
    var string: String { return String(String.UnicodeScalarView(self)) }
}
