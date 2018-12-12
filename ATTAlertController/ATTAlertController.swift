//
//  ATTAlertViewController.swift
//  TwitterAlertController
//
//  Created by Ammar AlTahhan on 10/12/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import UIKit

public class ATTAlertController: UIViewController {
    
    // MARK: - Constants
    
    let stackViewTopPadding: CGFloat = 20
    let stackViewBottomPadding: CGFloat = 20
    let stackViewLeadingPadding: CGFloat = 20
    let stackViewTrailingPadding: CGFloat = 20
    let buttonHeight: CGFloat = 40
    let interButtonSpace: CGFloat = 12
    let backgroundView = UIView()
    let stackView = UIStackView()
    
    // MARK: - Views
    
    var alertView: UIView!
    var buttons = [ATTAlertButton]()
    lazy var cancelButton = ATTAlertButton(title: "Cancel") { [unowned self] in
        self.dismissAlert()
    }
    var alertViewHeight: CGFloat {
        return (CGFloat(buttons.count) * (buttonHeight + interButtonSpace)) + stackViewTopPadding + stackViewBottomPadding
    }
    
    // MARK: - Initializers
    
    private override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(buttons: [ATTAlertButton]) {
        self.init()
        self.buttons = buttons
        self.buttons.append(cancelButton)
        modalPresentationStyle = .overCurrentContext
        UIView.setAnimationsEnabled(false)
    }
    
    // MARK: - Controller's lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupAlertView()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showController()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.setAnimationsEnabled(true)
    }
    
    // MARK: - Setups
    
    private func setupView() {
        view.backgroundColor = UIColor.clear
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0
        view.addSubview(backgroundView)
        backgroundView.frame = view.frame
        view.sendSubviewToBack(backgroundView)
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissAlert)))
    }
    
    private func setupAlertView() {
        alertView = UIView()
        alertView.backgroundColor = UIColor.mainColor
        alertView.layer.cornerRadius = 12
        alertView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.addSubview(alertView)
        
        setAlertViewConstraints()
        setAlertViewContentConstraints()
    }
    
    private func setAlertViewConstraints() {
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        alertView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        alertView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height - alertViewHeight).isActive = true
        alertView.transform = CGAffineTransform(translationX: 0, y: alertViewHeight)
    }
    
    private func setAlertViewContentConstraints() {
        for button in buttons {
            stackView.addArrangedSubview(button)
        }
        stackView.axis = .vertical
        stackView.spacing = interButtonSpace
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        alertView.addSubview(stackView)
        
        setStackViewConstraints()
    }
    
    private func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: stackViewLeadingPadding).isActive = true
        stackView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -stackViewTrailingPadding).isActive = true
        stackView.topAnchor.constraint(equalTo: alertView.topAnchor, constant: stackViewTopPadding).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: alertViewHeight - stackViewTopPadding - stackViewBottomPadding).isActive = true
    }
    
    // MARK: - Actions
    
    @objc private func dismissAlert() {
        hideController { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.dismiss(animated: false, completion: nil)
        }
    }
    
    // MARK: - Animation
    
    private func showController() {
        UIView.setAnimationsEnabled(true)
        UIView.animate(withDuration: 0.65, delay: 0.05, usingSpringWithDamping: 0.85, initialSpringVelocity: 0.01, options: .curveLinear, animations: {
            self.alertView.transform = .identity
            self.backgroundView.alpha = 0.3
        }, completion: nil)
        UIView.setAnimationsEnabled(false)
    }
    
    private func hideController(completion: ((Bool)->Void)? = nil) {
        UIView.animate(withDuration: 0.45, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 0.04, options: .curveLinear, animations: {
            self.alertView.transform = CGAffineTransform(translationX: 0, y: self.alertView.frame.height)
            self.backgroundView.alpha = 0
        }) { bool in
            completion?(bool)
        }
    }
    
    private func animateLayoutIfNeeded() {
        UIView.animate(withDuration: 0.65, delay: 0.05, usingSpringWithDamping: 0.85, initialSpringVelocity: 0.01, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}

