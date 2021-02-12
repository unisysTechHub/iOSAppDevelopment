//
//  ChildViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 15/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
///Users/ramesh/iOSProjects/IOSAppDevelopment/IOSAppDevelopment/EmbedSegue

import UIKit

class ChildViewController: UIViewController {

    @IBOutlet weak var childView: UILabel!
    var tag : String = "tag"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        childView.text = "Childview is loaded"
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
