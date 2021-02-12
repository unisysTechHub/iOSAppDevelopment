//
//  HorizontalLine.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 11/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

 @IBDesignable class HorizontalLine: UIView {

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
        self.backgroundColor = .red
    }
    
    
    override func draw(_ rect: CGRect) {
        let c = UIGraphicsGetCurrentContext()
        c?.move(to: CGPoint(x: 0, y: 0))
        c?.addLine(to: CGPoint(x: 100, y: 100))
        c?.strokePath()
        
        
        
    }

}
