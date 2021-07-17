//
//  BinaryTree.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 15/07/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import Foundation

@resultBuilder
struct CheckForBinarytree {
    typealias Component = [Int]
    typealias Expression = Int
    typealias Result = Bool
    static func buildExpression(_ element: Expression) -> Component {
        return [element]
    }
    static func buildExpression(_ component: Component) -> Component {
        return component
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
    static func buildFinalResult(_ component: ArrayBuilder.Component) -> Result {
        return true
    }
}

@CheckForBinarytree
func isBinaryTree(array : [Int]) -> Bool{
    array
}
