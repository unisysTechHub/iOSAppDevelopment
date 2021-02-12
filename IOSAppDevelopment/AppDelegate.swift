//
//  AppDelegate.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 02/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserv      ed.
//

import UIKit
import CoreData
let swiftOrangeColor = UIColor(red: 248 / 255.0, green: 96 / 255.0, blue: 47 / 255.0, alpha: 1.0)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
     var window: UIWindow?
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "AppMainStore")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
            container.viewContext.automaticallyMergesChangesFromParent = true

        }
        return container
    }()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override po  int for customization after application launch.
        if let rootVC = window?.rootViewController as? CoreDataViewController {
            rootVC.persistentContainer = (self.persistentContainer as! PersistentContainer)
            
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

