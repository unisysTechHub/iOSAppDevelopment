//
//  AuthoriztaionRequest.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 16/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import UserNotifications
var isNotificatinAuthorized : NotificationAuthorized = .notAuthorized

func requestAuthorziationForDisplayNotiifcations()
{
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        
        if let error = error {
            // Handle the error here.
            isNotificatinAuthorized = .notAuthorized
        }
        else{
            checkNotificationAuthorization()
        print("allow user notifications")
        }
        // Enable or disable features based on the authorization.
    }
}

func checkNotificationAuthorization()
{
    let center = UNUserNotificationCenter.current()
    center.getNotificationSettings { settings in
        guard (settings.authorizationStatus == .authorized) ||
                (settings.authorizationStatus == .provisional) else {
            isNotificatinAuthorized = .notAuthorized
            return  }

        if settings.alertSetting == .enabled {
            isNotificatinAuthorized = .alertOnly
            print("alert only authrization enabled")
        } else {
            isNotificatinAuthorized = .withSoundAndBadge
            print("schedule a notification with a sound and badge")
        }
    }
}
enum NotificationAuthorized  {
    
    case alertOnly
    case withSoundAndBadge
    case notAuthorized
}
