//
//  DiscardableResult.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 02/04/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import Foundation
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
        // return value of advance method unused - compiler warning -
        //discardableResult  -  supress compiler warning - that retun value is //used
    }
    init(name: String) {
        playerName = name
    }
}
