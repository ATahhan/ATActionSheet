//
//  HandleView.swift
//  ATTAlertController
//
//  Created by Ammar AlTahhan on 12/12/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import Foundation
import UIKit

class HandleView: UIView {
    
    override var bounds: CGRect {
        didSet {
            layer.cornerRadius = bounds.height/2
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightMainColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
