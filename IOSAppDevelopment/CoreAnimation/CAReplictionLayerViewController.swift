//
//  CAReplictionLayerViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 03/10/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

class CAReplictionLayerViewController: UIViewController {
    @IBOutlet weak var viewForReplicationLayer : UIView!
    var replicationLayer = CAReplicatorLayer()
    let instanceLayer = CALayer()
    let fadeAnimation  = CABasicAnimation(keyPath: "opacity")
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpReplicationLayer()
        setUpLayerFadeAnimation()
        setUpInstanceLayer()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setUpReplicationLayer()
    {
        replicationLayer.frame = viewForReplicationLayer.bounds
        // 1
        replicationLayer.frame = viewForReplicationLayer.bounds

        // 2
        
        replicationLayer.instanceCount = 16
        replicationLayer.instanceDelay = CFTimeInterval(100)

        // 3
        replicationLayer.instanceColor = UIColor.green.cgColor
        
        //4
        let angle = Float.pi * 2.0 / 16
        replicationLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
               // setInstaceLayerAnimation()
        viewForReplicationLayer.layer.addSublayer(replicationLayer)
    }

    func setUpInstanceLayer()
    {
        let midX = viewForReplicationLayer.bounds.midX - 10

        instanceLayer.frame = CGRect(x: midX, y: 0, width: 20, height: 60)
        instanceLayer.opacity = 1.0
        instanceLayer.backgroundColor = UIColor.green.cgColor
        replicationLayer.addSublayer(instanceLayer)
        
    }
    
    func setUpLayerFadeAnimation()
    {
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue = 0.0
        fadeAnimation.repeatCount = Float(Int.max)
        
    }
    
    func setInstaceLayerAnimation()
    {
        instanceLayer.opacity = 0.0
        instanceLayer.duration = CFTimeInterval(0.35)
        instanceLayer.add(fadeAnimation, forKey: "fadeAnimation")
    }
}
