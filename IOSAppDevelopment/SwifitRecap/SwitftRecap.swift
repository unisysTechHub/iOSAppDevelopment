//
//  SwitftRecap.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 19/02/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import Foundation
import  UIKit


func Test() -> (Int,Int)  {
    return (code : 1, nxtCode : 1)
}

enum SandwichError : Error
 {
    case outOfCleanDishes
    case missingIngredients(Int)
 }

func test1() throws {
    throw SandwichError.outOfCleanDishes
 

}

func makeASandwich() throws {
    // ...
}
func test() {
    let i = 0
    assert(i > 0)
    let index = 0
    precondition(index > 0)
do {
    try makeASandwich()
} catch  SandwichError.outOfCleanDishes {
  //  washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    //buyGroceries(ingredients)
}
catch is Error {}
}
