//
//  NotificationViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 17/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit
import Combine

class NotificationViewController: UIViewController, UNUserNotificationCenterDelegate {
    var cancellable : AnyCancellable? = nil
    let TAG = "tryMapUseCase"
    let publisher1 = CurrentValueSubject<Bool,Never>(true)
    let publisher2 = CurrentValueSubject<Bool,Never>(true)
    
    @IBAction func SendNotification(_ sender: Any) {
        publisher1.send(true)

        if isNotificatinAuthorized != NotificationAuthorized.notAuthorized
        {
            print("send notification")
            regiserMeetingActionsAndNotificationTypes()
            sendMeetingNotification()
        }
        else
        {
        print("not authorized to send meeting notification")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        //TryMapUsecase()
        
//     cancellable =   comibineLatest(publisher1: publisher1, publisher2: publisher2).sink { (value) in
//            print("\(self.TAG)   published values \(value)")
//        }
           let tryMapErrorPublisher = CurrentValueSubject<Int,SequenceError>(1)

        tryMapErrorPublisher.send(completion: Subscribers.Completion<SequenceError>.failure(SequenceError()))
        tryMapUseCase().sink { (comeletion) in
            switch comeletion
            {
            case .failure(let error ) :
                let sequenceError = error as! SequenceError
                print(sequenceError.errorMessage)
            case .finished :
                print("\(self.TAG) emission finished")
            }
        } receiveValue: { (value) in
            print("\(self.TAG) published value \(value)")
        }


      //  publisher1.send(true)
//        publisher2.send(false)
//        publisher1.send(false)
        requestAuthorziationForDisplayNotiifcations()
////         Publishers.NumberSequencePublisher().subscribe(NumberSequenceSubscriber())
//        Publishers.NumberSequencePublisher().combineLatest(Publishers.NumberSequencePublisher()).sink { (publisher1Value, publisher2Value) in
//            print("value from publisher 1 \(publisher1Value)")
//            print("value from publsher 2 \(publisher2Value)")
//        }
        
//        Publishers.NumberSequencePublisher().sink { (completion) in
//            print("completion")
//        } receiveValue: { (value) in
//            print(value)
//        }



        
        // Do any additional setup after loading the view.
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("user Notification center delegate method")
        processMeetingNotification(didReceive: response)
        completionHandler()
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
