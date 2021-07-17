//
//  DispatchQueueUserCase.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 03/03/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import Foundation
let concurrentQueue = DispatchQueue(label: "com.queue.Concurrent", attributes: .concurrent)

func performAsyncTaskIntoConcurrentQueue(with completion: @escaping () -> ()) {
        let group = DispatchGroup()
        for i in 1...1 {
            group.enter()
            concurrentQueue.async {
                let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")!
                let _ = try! Data(contentsOf: imageURL)
                print("###### Image \(i) Downloaded ######")
                group.leave()
            }
        }
        
        /* Either write below code or group.notify() to execute completion block
         group.wait()
         DispatchQueue.main.async {
         completion()
         }
         */
        
        group.notify(queue: DispatchQueue.main) {
            completion()
        }
}


 func downloadImages()
 {
    print("###### Download all images asynchronously and notify on completion ######")
    print("############")
    print("############\n")

    performAsyncTaskIntoConcurrentQueue(with: {
        print("\n############")
        print("############")
        print("###### All images are downloaded")
    })

 }
