//
//  ShowContactsViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 12/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit
import ContactsUI

class ShowContactsViewController: UIViewController, CNContactPickerDelegate {
    @IBAction func OnShowContactsClicked(_ sender: UIButton) {
        let contactsPicker = CNContactPickerViewController()
        contactsPicker.delegate = self
        present(contactsPicker,animated: true,completion: nil)
//        let cocoaLearningStoryBoard = UIStoryboard(name: "CocoaLearning", bundle: nil)
//
//        let cocoaLearningViewControler = cocoaLearningStoryBoard.instantiateViewController(identifier: "Cocoa") as! CocoaViewController
//        present(cocoaLearningViewControler,animated: true,completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

