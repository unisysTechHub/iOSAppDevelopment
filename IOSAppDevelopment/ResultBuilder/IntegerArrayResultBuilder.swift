//
//  IntegerArrayResultBuilder.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 15/07/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import Foundation
@resultBuilder
struct ArrayBuilder {
    typealias Component = [Int]
    typealias Expression = Int
    
    static func buildExpression(_ element: Expression) -> Component {
        return [element]
    }
    
    static func buildOptional(_ component: Component?) -> Component {
        guard let component = component else { return [] }
        return component
    }
    static func buildEither(first component: Component) -> Component {
        return component
    }
    static func buildEither(second component: Component) -> Component {
        return component
    }
    static func buildArray(_ components: [Component]) -> Component {
        return Array(components.joined())
    }
    static func buildBlock(_ components: Component...) -> Component {
        return Array(components.joined())
    }
    
}
let someNumber = 19
func testIntegerArrayBuilder() {
    @ArrayBuilder var testArray : [Int] {
        if someNumber < 12 {
               31
           } else if someNumber == 19 {
               32
           } else {
               33
           }
        
    }
   let result = isBinaryTree(array: testArray)
    print("@resut array builder \(result)")
    
}
