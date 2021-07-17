//
//  BasicOperators.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 19/02/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import Foundation


func testOperators() {
    var gender : Bool = true
    gender ? print("true") : print("false")
    let i = 0
    i==0 ? print("True") : print("False")
    // if contain value returns j otherewise returns 0
    var j : Int? = nil
    let k = j ?? 0
    
    
}

func rangeOperators()
{
    //1 and 5 include
    for index in 1...5 {
        print(index)
    }
   // 5 not included
    for index in 1..<5 {
        
    }
    let values = ...5
    values.contains(2)
    var names = [1,2,3]
    
    for values in names[..<2] {
        
    }
    
}
