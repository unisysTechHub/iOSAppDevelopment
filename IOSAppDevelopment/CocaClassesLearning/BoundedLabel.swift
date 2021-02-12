//
//  BoundedLabel.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 11/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

@IBDesignable class BoundedLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
    }
    override func drawText(in rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()
        context?.stroke(self.bounds.insetBy(dx: 1  , dy: 1 ))
    super.drawText(in: rect.insetBy(dx: 10.0, dy: 5.0))
    }

    
}
