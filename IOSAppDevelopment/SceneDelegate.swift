//
//  SceneDelegate.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 02/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit
import Combine
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var cancellable1 : AnyCancellable?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        testStructInOut()
            print("@Ramesh willConnectTo")
        let s = NSString("Test")
        let y = String(s)
        var x : Int? = nil
        x = 10
        var result : Result<Int,Error> = .success(190)
        switch result {
        case .success(let code):
            print(code)
        default:
            print("Test")
        }
        testIntegerArrayBuilder()
        guard let _ = (scene as? UIWindowScene) else { return }
        //startLoad()
        //subscribeToDidFileDownloadNofiction()
      //  let fileDownloadInstance = FileDownlaod()
       // fileDownloadInstance.registerNotication()
       // fileDownloadInstance.postNotifcation()
       // CombinePracticeTimer().publisher()
        //checkNotificationAuthorization()
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("@Ramesh sceneDidBecomeActive")
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("@Ramesh sceneWillResignActive")

        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print("@Ramesh sceneWillEnterForeground")

        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("@Ramesh sceneDidEnterBackground \(scene.session.configuration.debugDescription)")

        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

