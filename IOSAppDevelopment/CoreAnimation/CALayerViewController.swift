//
//  CALayerViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 16/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

class CALayerViewController: UIViewController {
    @IBOutlet weak  var myView: UIView!
    let layer = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayer()
        myView.layer.addSublayer(layer)

        
//         let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 100))
       //  myView = UIView(frame: frame)
        // myView.backgroundColor = .black
        // view.addSubview(myView)
        // Do any additional setup after loading the view.
    }
//    override func viewDidAppear(_ animated: Bool) {
//         super.viewDidAppear(animated)
//
//         let animation = CABasicAnimation(keyPath: "position.x")
//         animation.fromValue = CGPoint.zero
//         animation.toValue = view.bounds.size.width
//         animation.duration = 0.5
//         animation.beginTime = CACurrentMediaTime() + 0.3
//         animation.repeatCount = 4
//         animation.autoreverses = true
//
//        // myView.layer.add(animation, forKey: nil)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
        print("segue called")
        if segue.identifier == "calayerembedsegue"
        {
            if let caLayerAnimationVC = segue.destination as? CALayerAnimationViewController
            {
                caLayerAnimationVC.layerViewController = self
            }
        }

    }

}


extension CALayerViewController {
  func setUpLayer() {
    //1
    layer.frame = myView.bounds
    layer.contents = UIImage(named: "star")?.cgImage

    // 2
    layer.contentsGravity = .center
    layer.magnificationFilter = .linear

    // 3
    layer.cornerRadius = 100.0
    layer.borderWidth = 12.0
    layer.borderColor = UIColor.white.cgColor
    layer.backgroundColor = swiftOrangeColor.cgColor

    //4
    layer.shadowOpacity = 0.75
    layer.shadowOffset = CGSize(width: 0, height: 3)
    layer.shadowRadius = 3.0
    layer.isGeometryFlipped = false
//    layer.contentsRect = CGRect(x: 0, y: 0, width: 1, height: 1)
   // layer.contentsCenter = CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5)
  }
}
