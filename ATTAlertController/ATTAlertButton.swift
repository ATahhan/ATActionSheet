//
//  ATTAlertViewControllerButton.swift
//  TwitterAlertController
//
//  Created by Ammar AlTahhan on 10/12/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import UIKit

public class ATTAlertButton: UIView {
    
    private let imageViewWidth: CGFloat = 20
    private let interImageTitleSpace: CGFloat = 16
    
    private var button = UIButton()
    private var imageView = UIImageView()
    
    private var onTapCompletion: (()->Void)?
    private var isCancelButton: Bool
    
    public override var bounds: CGRect {
        didSet {
            if isCancelButton {
                layer.cornerRadius = frame.height/2
                layer.masksToBounds = true
            }
        }
    }
    
    // MARK: - Initializers
    
    private override init(frame: CGRect) {
        isCancelButton = false
        onTapCompletion = nil
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(title: String, image: UIImage? = nil, completion: @escaping ()->Void) {
        self.init()
        button.setTitle(title, for: .normal)
        imageView.image = image
        onTapCompletion = completion
        isCancelButton = false
        setupView()
    }
    
    convenience init(title: String, completion: @escaping ()->Void) {
        self.init()
        button.setTitle(title, for: .normal)
        onTapCompletion = completion
        isCancelButton = true
        setupView()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        button.setTitleColor(.whiteContent, for: .normal)
        addSubview(button)
        setButtonConstraints()
        if !isCancelButton {
            setupNotCancelView()
        } else {
            backgroundColor = .lightMainColor
        }
        
        setButtonAction()
    }
    
    private func setupNotCancelView() {
        button.contentHorizontalAlignment = .leading
        button.imageView?.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleAspectFit
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .lightGreyBackground
        addSubview(imageView)
        bringSubviewToFront(button)
        setImageViewConstraints()
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: imageViewWidth + interImageTitleSpace, bottom: 0, right: 0)
    }
    
    private func setButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        button.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    private func setImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageViewWidth).isActive = true
    }
    
    private func setButtonAction() {
        button.addTarget(self, action: #selector(self.buttonAction(_:)), for: .touchUpInside)
    }
    
    @objc private func buttonAction(_ sender: Any) {
        onTapCompletion?()
    }
    
}
