//
//  SignUpViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 06/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstNameLabel = UILabel()
        firstNameLabel.text = "First Name"
        let firstNameTextField = UITextField()
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstNameLabel)
        view.addSubview(firstNameTextField)
        let containter = UILayoutGuide()
        
        view.addLayoutGuide(containter)
        
        firstNameLabel.leadingAnchor.constraint(equalTo: containter.leadingAnchor, constant: 10).isActive = true
        
        firstNameTextField.firstBaselineAnchor.constraint(equalTo: firstNameLabel.firstBaselineAnchor, constant: 10).isActive = true
    }
}
