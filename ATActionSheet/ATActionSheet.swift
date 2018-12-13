//
//  ATTAlertViewController.swift
//  TwitterAlertController
//
//  Created by Ammar AlTahhan on 10/12/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import UIKit

public class ATActionSheet: UIViewController {
    
    // MARK: - Constants
    
    let stackViewTopPadding: CGFloat = 20
    let stackViewBottomPadding: CGFloat = 20
    let stackViewLeadingPadding: CGFloat = 20
    let stackViewTrailingPadding: CGFloat = 20
    let buttonHeight: CGFloat = 35
    let interButtonSpace: CGFloat = 16
    let backgroundView = UIView()
    let stackView = UIStackView()
    let handleView = HandleView()
    
    // MARK: - Views
    
    var alertView: UIView!
    var actions = [ATAction]()
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    var initialAlertViewFrame: CGRect!
    lazy var cancelButton = ATAction(title: "Cancel") { [unowned self] in
        self.dismissAlert()
    }
    var alertViewHeight: CGFloat {
        return (CGFloat(actions.count) * (buttonHeight + interButtonSpace)) + stackViewTopPadding + stackViewBottomPadding
    }
    
    // MARK: - Initializers
    
    private override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        customInit()
    }
    
    private func customInit() {
        modalPresentationStyle = .overCurrentContext
        UIView.setAnimationsEnabled(false)
    }
    
    // MARK: - Controller's lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        actions.append(cancelButton)
        setupBackgroundView()
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
    
    public func addActions(_ actions: [ATAction]) {
        self.actions.unsheft(contentsOf: actions)
        
    }
    
    // MARK: - Setups
    
    private func setupBackgroundView() {
        view.backgroundColor = UIColor.clear
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0
        backgroundView.frame = view.frame
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissAlert)))
        view.addSubview(backgroundView)
        view.sendSubviewToBack(backgroundView)
    }
    
    private func setupAlertView() {
        alertView = UIView()
        alertView.backgroundColor = UIColor.ATBackgroundColor
        alertView.layer.cornerRadius = 12
        alertView.roundCorners([.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 12)
        alertView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panGestureRecognizerHandler(_:))))
        view.addSubview(alertView)
        
        setAlertViewConstraints()
        setAlertViewContentConstraints()
    }
    
    private func reloadAlertViewConstraints() {
        
    }
    
    private func setAlertViewConstraints() {
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        alertView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        alertView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height - alertViewHeight).isActive = true
        alertView.transform = CGAffineTransform(translationX: 0, y: alertViewHeight)
    }
    
    private func setAlertViewContentConstraints() {
        for button in actions {
            stackView.addArrangedSubview(button)
        }
        stackView.axis = .vertical
        stackView.spacing = interButtonSpace
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        alertView.addSubview(stackView)
        alertView.addSubview(handleView)
        
        setHandleViewConstraints()
        setStackViewConstraints()
    }
    
    private func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: stackViewLeadingPadding).isActive = true
        stackView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -stackViewTrailingPadding).isActive = true
        stackView.topAnchor.constraint(equalTo: alertView.topAnchor, constant: stackViewTopPadding).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: alertViewHeight - stackViewTopPadding - stackViewBottomPadding).isActive = true
    }
    
    private func setHandleViewConstraints() {
        handleView.translatesAutoresizingMaskIntoConstraints = false
        handleView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
        handleView.widthAnchor.constraint(equalTo: alertView.widthAnchor, multiplier: 0.2).isActive = true
        handleView.heightAnchor.constraint(equalToConstant: 6).isActive = true
        handleView.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 8).isActive = true
    }
    
    // MARK: - Actions
    
    @objc func dismissAlert() {
        hideController { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.dismiss(animated: false, completion: nil)
        }
    }

}


