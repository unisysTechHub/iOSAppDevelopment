//
//  KeyChainViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 23/08/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import UIKit

class KeyChainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
            
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        do {
            
       let password = try keychainPasswordItemShared.readPassword()
            let storyboard = UIStoryboard(name: "CoreData", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "emplist")
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
            }
        catch (let error ){
            print("read password error \(error)")
            let storyboard = UIStoryboard(name: "CoreData", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "CoreDataMainViewController")
            if let rootVC = controller as? CoreDataViewController {
                let appDeleage = UIApplication.shared.delegate as! AppDelegate
                rootVC.persistentContainer = appDeleage.persistentContainer as? PersistentContainer
                controller.modalPresentationStyle = .fullScreen
                present(controller, animated: true)
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
