//
//  Color.swift
//  CSVA
//
//  Created by Ammar AlTahhan on 01/07/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    /// Hex = 0xFBFFFF
    class var ATTextColor: UIColor {
        return UIColor(rgb: 0xFBFFFF)
    }
    
    /// Hex = 0x8A98A4
    class var ATImageTintColor: UIColor {
        return UIColor(rgb: 0x8A98A4)
    }
    
    /// Hex = 0xCFCFCF
    class var ATTintColor: UIColor {
        return UIColor(rgb: 0xCFCFCF)
    }
    
    /// Hex = 0x16202B
    class var ATBackgroundColor: UIColor {
        return UIColor(rgb: 0x16202B)
    }
    
    /// Hex = 0x263345
    class var lightMainColor: UIColor {
        return UIColor(rgb: 0x263345)
    }
    
    /// Hex = 0xC65D14
    class var wrongRed: UIColor {
        return UIColor(rgb: 0xC65D14)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
