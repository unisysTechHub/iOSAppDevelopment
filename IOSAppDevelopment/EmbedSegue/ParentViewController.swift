//
//  ParentViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 15/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue called")
        if segue.identifier == "embedSegue"
        {
            if let childViewController = segue.destination as? ChildViewController
            {
                // set data on childview controller instance.
            }
        }
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
