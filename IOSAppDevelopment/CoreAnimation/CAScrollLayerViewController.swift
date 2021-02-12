//
//  ScrollLayerViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 28/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

class CAScrollLayerViewController: UIViewController {
   
    @IBAction func onGestureRecognized(_ sender: UIPanGestureRecognizer) {
        print("gest recognized")
    }
    
    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var horizontalScrollingSwitch : UISwitch!
    @IBOutlet weak var verticalScrollingSwith : UISwitch!
    
    
    var scrollViewLayer : CAScrollLayer?
    {
        return scrollView.layer as? CAScrollLayer
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollViewLayer?.scrollMode = .both
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

}

extension CAScrollLayerViewController
{
    @IBAction func onSwithChange(sender : UISwitch)
    {
        print("switch changed")
        switch (horizontalScrollingSwitch.isOn, verticalScrollingSwith.isOn) {
        case  (true, true) :
            scrollViewLayer?.scrollMode = .both
        case (true, false) :
            scrollViewLayer?.scrollMode = .horizontally
        case (false, true) :
            scrollViewLayer?.scrollMode = .vertically
        default:
            scrollViewLayer?.scrollMode = .none
        }
        
    }
//    @IBAction func onPanGestureRecognized(_ sender: UIPanGestureRecognizer) {
//        print("pan recognized ")
//        var newPoint = scrollView.bounds.origin
//        newPoint.x -= sender.translation(in: scrollView).x
//        newPoint.y -= sender.translation(in: scrollView).y
//        scrollViewLayer?.scroll(to: newPoint)
//
//     }
}
