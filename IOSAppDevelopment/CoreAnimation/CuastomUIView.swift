//
//  CuastomUIView.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 30/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

// Overriding DisplayLayer
extension UILabel
{
    func padding(top : CGFloat, bottom : CGFloat, left : CGFloat, right : CGFloat)
    {
        var currentSize = self.intrinsicContentSize
        currentSize.height += top + bottom
        currentSize.width  += left + bottom
        self.layer.frame = self.bounds.inset(by: UIEdgeInsets(top: top, left: left, bottom: bottom, right: right))    }
  
    
}
