//
//  ViewController.swift
//  Example
//
//  Created by Ammar AlTahhan on 30/12/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import UIKit
import ATActionSheet

class ViewController: UIViewController {
    
    let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        button.setTitle("Open", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.ATBackgroundColor
        button.addTarget(self, action: #selector(self.openATActionSheet), for: .touchUpInside)
        view.addSubview(button)
        setButtonConstraints(button)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.layer.cornerRadius = button.bounds.height/2
    }
    
    @objc func openATActionSheet(_ sender: Any) {
        
        let actionSheet = ATActionSheet()
        
        let addButton = ATAction(title: "Add New Item", image: #imageLiteral(resourceName: "add")) {
            print("Added")
        }
        let shareButton = ATAction(title: "Share", image: #imageLiteral(resourceName: "action"), style: .default) {
            print("Share")
        }
        let deleteButton = ATAction(title: "Delete", image: #imageLiteral(resourceName: "trash"), style: .destructive) {
            print("Deleted")
        }
        
        actionSheet.addActions([addButton, shareButton, deleteButton])
        present(actionSheet, animated: true, completion: nil)
        
    }
    
    private func setButtonConstraints(_ button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 0.12).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
