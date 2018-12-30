//
//  ATTAlertViewControllerButton.swift
//  TwitterAlertController
//
//  Created by Ammar AlTahhan on 10/12/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import UIKit

public class ATAction: UIView {
    
    private let leftButtonPadding: CGFloat = 8
    private let imageViewWidth: CGFloat = 20
    private let interImageTitleSpace: CGFloat = 20
    
    private var button = UIButton()
    private var imageView = UIImageView()
    
    private var onTapCompletion: (()->Void)?
    private var isCancelButton: Bool
    private var _style: ATAction.Style
    
    public override var bounds: CGRect {
        didSet {
            if isCancelButton {
                layer.cornerRadius = frame.height/2
                layer.masksToBounds = true
            }
        }
    }
    public var style: ATAction.Style { return _style }
    
    // MARK: - Initializers
    
    private override init(frame: CGRect) {
        isCancelButton = false
        onTapCompletion = nil
        _style = .default
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(title: String, image: UIImage? = nil, style: ATAction.Style = .default, completion: @escaping ()->Void) {
        self.init()
        button.setTitle(title, for: .normal)
        imageView.image = image
        onTapCompletion = completion
        isCancelButton = false
        _style = style
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
        button.setTitleColor(style == .default ? .ATTextColor : .ATDestructiveColor, for: .normal)
        addSubview(button)
        setButtonConstraints()
        if !isCancelButton {
            setupNotCancelView()
        } else {
            setupCancelButton()
        }
        
        setButtonAction()
    }
    
    private func setupCancelButton() {
        backgroundColor = .lightMainColor
    }
    
    private func setupNotCancelView() {
        if #available(iOS 11.0, *) {
            button.contentHorizontalAlignment = .leading
        } else {
            button.contentHorizontalAlignment = .left
        }
        button.imageView?.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleAspectFit
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = style == .default ? .ATImageTintColor : .ATDestructiveColor
        addSubview(imageView)
        bringSubviewToFront(button)
        setImageViewConstraints()
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: leftButtonPadding + imageViewWidth + interImageTitleSpace, bottom: 0, right: 0)
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
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leftButtonPadding).isActive = true
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
