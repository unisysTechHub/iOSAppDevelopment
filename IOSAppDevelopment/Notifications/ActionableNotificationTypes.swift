//
//  ActionableNotificationTypes.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 16/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import UserNotifications

func regiserMeetingActionsAndNotificationTypes()
{
    let acceptAction = UNNotificationAction(identifier: "ACCEPT_ACTION",
          title: "Accept",
          options: UNNotificationActionOptions(rawValue: 0))
    let declineAction = UNNotificationAction(identifier: "DECLINE_ACTION",
          title: "Decline",
          options: UNNotificationActionOptions(rawValue: 0))
    // Define the notification type
    let meetingInviteCategory =
          UNNotificationCategory(identifier: "MEETING_INVITATION",
          actions: [acceptAction, declineAction],
          intentIdentifiers: [],
          hiddenPreviewsBodyPlaceholder: "",
          options: .customDismissAction)
    // Register the notification type.
    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.setNotificationCategories([meetingInviteCategory])
}


func sendMeetingNotification()
{
    let content = configureMeetingNotificationContent()
    let uuidString = UUID().uuidString
//    let timeIntervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
    let request = UNNotificationRequest(identifier: uuidString,
                content: content, trigger: nil)

    // Schedule the request with the system.
    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.add(request) { (error) in
       if error != nil {
        print(error)
       }
        
    }
}

func configureMeetingNotificationContent() -> UNMutableNotificationContent
{
    let content = UNMutableNotificationContent()
    content.title = "Weekly Staff Meeting"
    content.body = "Every Tuesday at 2pm"
    content.userInfo = ["MEETING_ID" : "meetingID",
                        "USER_ID" : "userID" ]
    content.categoryIdentifier = "MEETING_INVITATION"
    
    return content
}
func processMeetingNotification(
       didReceive response: UNNotificationResponse) {
       
   // Get the meeting ID from the original notification.
   let userInfo = response.notification.request.content.userInfo
   let meetingID = userInfo["MEETING_ID"] as! String
   let userID = userInfo["USER_ID"] as! String
    print(response.actionIdentifier)
   // Perform the task associated with the action.
   switch response.actionIdentifier {
   case "ACCEPT_ACTION":
          print("meeting invitation accepted")
      break
        
   case "DECLINE_ACTION":
      print("meetng invitation declined")
      break
        
   // Handle other actions…
 
   default:
      break
   }
    
   // Always call the completion handler when done.
   }
