//
//  IOSViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 24/04/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import UIKit
fileprivate let url = URL(string: "https://loan-on-property-applcation-bucket.s3.ap-south-1.amazonaws.com/customer-poreprty-documents111111/loan-property-doucments-human-review-wokk-flow/2020/11/11/02/23/59/human-loop-name-1234/output.json")!
fileprivate let image = UIImage(systemName: "pencil")
class IOSViewController: UIViewController {
    @IBAction func showActivityViewWithExtensios(_ sender: Any) {
        let uiActivityConotroller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        uiActivityConotroller.popoverPresentationController?.barButtonItem = self.barButton
        present(uiActivityConotroller, animated: true) {
            
        }
    }
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var agreeTermsButton: UIButton!
    @IBAction func deleteItem(_ sender: Any) {
        
        let destroyAction = UIAlertAction(title: "Delete",
                     style: .destructive) { (action) in
            // Respond to user selection of the action
           }
           let cancelAction = UIAlertAction(title: "Cancel",
                     style: .cancel) { (action) in
            // Respond to user selection of the action
           }
                
           let alert = UIAlertController(title: "Delete the image?",
                       message: "",
                       preferredStyle: .actionSheet)
           alert.addAction(destroyAction)
           alert.addAction(cancelAction)
                
           // On iPad, action sheets must be presented from a popover.
           alert.popoverPresentationController?.barButtonItem =
                       self.barButton
        let storyboard = UIStoryboard(name: "CoreData", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "emplist")
        controller.modalPresentationStyle = .formSheet
        present(controller, animated: true)
        alert.view.addSubview(controller.view)
           self.present(alert, animated: true) {
              // The alert was presented
           }

    }
    @IBAction func agreeTerms(_ sender: Any) {
        let defaultAction = UIAlertAction(title: "Agree",
                                style: .default) { (action) in
            // Respond to user selection of the action.
           }
           let cancelAction = UIAlertAction(title: "Disagree",
                                style: .cancel) { (action) in
            // Respond to user selection of the action.
           }
           
           // Create and configure the alert controller.
           let alert = UIAlertController(title: "Terms and Conditions",
                 message: "Click Agree to accept the terms and conditions.",
                 preferredStyle: .alert)
           alert.addAction(defaultAction)
           alert.addAction(cancelAction)
                
           self.present(alert, animated: true) {
              // The alert was presented
           }
        

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("@rAMESH agree terms")
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
