//
//  UITextfiledWithLeftRightView.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 22/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import UIKit
extension UITextField {
public func setIcon(_ image: UIImage) {
   let iconView = UIImageView(frame:
                  CGRect(x: 10, y: 5, width: 25, height: 25))
   iconView.image = image
   let iconContainerView: UIView = UIView(frame:
                  CGRect(x: 20, y: 0, width: 30, height: 30))
   iconContainerView.addSubview(iconView)
   leftView = iconContainerView
   leftViewMode = .always
}
    public func progressBar(state changSateTo : String) {
       let progressBarView = UIActivityIndicatorView(frame:
                                                CGRect(x: 10, y: 5, width: 25, height: 25))
       let progressBarContainerView : UIView = UIView(frame:
                      CGRect(x: 10, y: 0, width: 30, height: 30))
        progressBarContainerView.addSubview(progressBarView)
       rightView = progressBarContainerView
       rightViewMode = .always
        if (changSateTo == "stop")
        {
            progressBarView.stopAnimating()
        }
        else if (changSateTo == "start"){
            progressBarView.startAnimating()

        }
    }
}
