//
//  NotifcationCenterName.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 08/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import Combine
extension Notification.Name {

    static let didFileDownlaod = Notification.Name("fileDownloaded")

}


class FileDownlaod
{
    var cancelables = Set<AnyCancellable>()
    func registerNotication()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(didFileDownload(_:)), name: Notification.Name.didFileDownlaod, object: nil)
        
      let didFileDownalodNotificatinPublisher =   NotificationCenter.default.publisher(for: .didFileDownlaod)
        didFileDownalodNotificatinPublisher.sink { (notification) in
            print("subscriber received notificaton\(notification.description)")
        }.store(in: &cancelables)
    }

    @objc func didFileDownload(_ notification :Notification) {
        print("on file download notification\(notification.name)")
    }
    func postNotifcation()
    {
        NotificationCenter.default.post(name: NSNotification.Name.didFileDownlaod, object: nil)
    }
}
