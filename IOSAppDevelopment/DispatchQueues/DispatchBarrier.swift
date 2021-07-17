//
//  DispatchBarrier.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 03/03/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import Foundation
var value: Int = 2
//When submitted to a concurrent queue, a work item with this flag acts as a barrier. Work items submitted prior to the barrier execute to completion, at which point the barrier work item executes. Once the barrier work item finishes, the queue returns to scheduling work items that were submitted after the barrier.

func dispathBarrierUseCase() {
concurrentQueue.async(flags: .barrier) {
    for i in 0...3 {
        value = i
        print("\(value) ✴️")
    }
}

concurrentQueue.async {
    print(value)
}

concurrentQueue.async(flags: .barrier) {
    for j in 4...6 {
        value = j
        print("\(value) ✡️")
    }
}

concurrentQueue.async {
    value = 14
    print(value)
}
}
