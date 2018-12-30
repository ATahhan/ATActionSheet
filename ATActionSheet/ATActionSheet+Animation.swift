//
//  ATTAlertController+Animation.swift
//  ATTAlertController
//
//  Created by Ammar AlTahhan on 12/12/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import Foundation
import UIKit

extension ATActionSheet {
    
    // MARK: - Animation
    
    func showController() {
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 0.55, delay: 0.05, usingSpringWithDamping: 0.85, initialSpringVelocity: 0.01, options: .curveLinear, animations: {
            self.alertView.transform = .identity
            self.backgroundView.alpha = 0.3
        }, completion: nil)
        UIView.setAnimationsEnabled(false)
    }
    
    func hideController(completion: ((Bool)->Void)? = nil) {
        UIView.animate(withDuration: 0.55, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 0.02, options: .curveLinear, animations: {
            self.alertView.transform = CGAffineTransform(translationX: 0, y: self.alertView.frame.height)
            self.backgroundView.alpha = 0
        }) { bool in
            completion?(bool)
        }
    }
    
    @objc func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: view.window)
        
        switch sender.state {
        case .began:
            initialTouchPoint = touchPoint
            initialAlertViewFrame = alertView.frame
        case .changed:
            let diff = touchPoint.y - initialTouchPoint.y
            let slowFactor: CGFloat = diff < 0 ? 0.4 : 1
            alertView.transform = CGAffineTransform(translationX: 0, y: diff*slowFactor)
        case .ended, .cancelled:
            if touchPoint.y - initialTouchPoint.y > stackView.frame.size.height/3 {
                dismissAlert()
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.alertView.transform = .identity
                })
            }
        default:
            break
        }
    }
}
