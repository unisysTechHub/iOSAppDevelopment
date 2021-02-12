//
//  CAShapeLayerViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 16/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

class CAShapeLayerViewController: UIViewController {
    @IBOutlet weak var viewForShapeLayer : UIView!
    var shapeLayer = CAShapeLayer()
    var x  : String?
    let openPath = UIBezierPath()
    let closedPath = UIBezierPath()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPath()
        setUpShapeLayer()
        
        viewForShapeLayer.layer.addSublayer(shapeLayer)
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        
    }
    
    

}
extension CAShapeLayerViewController {
  func setUpPath() {
    let frame = viewForShapeLayer.bounds.inset(by: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2))
    let viewBoundx = frame.origin.x + 60
    let viewBoundy = frame.origin.y
    
    print(    frame.height
              ,frame.width)
    openPath.move(to: CGPoint(x: viewBoundx + 30, y: viewBoundy + 196))

    openPath.addCurve(
      to: CGPoint( x: viewBoundx + 112.0, y:viewBoundy + 12.5),
      controlPoint1: CGPoint(x:viewBoundx + 110.56, y:viewBoundy +  13.79),
      controlPoint2: CGPoint(x: viewBoundx + 112.07, y: viewBoundy + 13.01))

    openPath.addCurve(
      to: CGPoint(x: viewBoundx + 194, y: viewBoundy + 196),
      controlPoint1: CGPoint(x: viewBoundx + 111.9, y: viewBoundy + 11.81),
      controlPoint2: CGPoint(x: viewBoundx + 194, y: viewBoundy + 196))

    openPath.addLine(to: CGPoint(x:viewBoundx + 50, y: viewBoundy + 85.68))
    openPath.addLine(to: CGPoint(x: viewBoundx + 194.0, y:viewBoundy + 48.91))
    openPath.addLine(to: CGPoint(x:viewBoundx + 30, y:  viewBoundy + 196))
  }

  func setUpShapeLayer() {
    // 1
    shapeLayer.path = openPath.cgPath

    // 2
    shapeLayer.lineCap = .butt
    shapeLayer.lineJoin = .miter
    shapeLayer.miterLimit = 4.0

    // 3
    shapeLayer.lineWidth = CGFloat(5)
    shapeLayer.strokeColor = swiftOrangeColor.cgColor
    shapeLayer.fillColor = UIColor.white.cgColor

    // 4
    shapeLayer.lineDashPattern = nil
    shapeLayer.lineDashPhase = 0.0

  }
}
