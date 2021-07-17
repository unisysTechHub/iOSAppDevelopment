//
//  Structures.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 03/04/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import Foundation
struct ValueType {
    var name : String?
    
    mutating func method()
    {
        self.name = "mutated"
    }
}

func testSwap (a : inout Int, b : inout Int) {
    a = 6
    b = 7
}

func testStructInOut() {
    var a = 4;
    var b = 5;
    testSwap(a: &a, b: &b)
    print("a = \(a) b = \(b)")
}
