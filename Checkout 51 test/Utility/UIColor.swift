//
//  UIColor.swift
//  Checkout 51 test
//
//  Created by yuehengshi on 2022-05-11.
//

import Foundation
import UIKit
extension UIColor {
    
    // I just assume it is this green
    public static let checkout51_green = UIColor(hex: 0x167253)
    
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}
