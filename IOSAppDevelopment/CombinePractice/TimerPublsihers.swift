//
//  TimerPublsihers.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 08/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import Combine

class CombinePracticeTimer
{ 
    var cancellables   = Set<AnyCancellable>()
    func publisher()
    {
         let publisher = Timer.publish(every: 1, on: .main, in: .default)
          publisher.autoconnect().receive(on: DispatchQueue.main)
            .sink(receiveValue: { (data) in
                print(Date())
            }).store(in: &cancellables)
                
    }
    
}
