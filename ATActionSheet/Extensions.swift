//
//  Extensions.swift
//  ATTAlertController
//
//  Created by Ammar AlTahhan on 12/12/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import Foundation
import UIKit

extension Array {
    mutating func unsheft(contentsOf new: [Element]) {
        let copy = self
        self = []
        self.append(contentsOf: new)
        self.append(contentsOf: copy)
    }
}

extension UIView {
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        if #available(iOS 11, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = corners
        } else {
            var cornerMask = UIRectCorner()
            if(corners.contains(.layerMinXMinYCorner)){
                cornerMask.insert(.topLeft)
            }
            if(corners.contains(.layerMaxXMinYCorner)){
                cornerMask.insert(.topRight)
            }
            if(corners.contains(.layerMinXMaxYCorner)){
                cornerMask.insert(.bottomLeft)
            }
            if(corners.contains(.layerMaxXMaxYCorner)){
                cornerMask.insert(.bottomRight)
            }
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: cornerMask, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}
