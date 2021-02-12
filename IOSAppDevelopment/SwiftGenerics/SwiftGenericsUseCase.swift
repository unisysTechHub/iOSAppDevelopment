//
//  SwiftGenericsUseCase.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 13/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation

protocol Container {
    associatedtype Item
    mutating func append(_ item : Item)
    var count : Int { get}
    subscript(i : Int ) -> Item {get}
}

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

struct Stack<Element> : Container {
   
   mutating func append(_ item: Element)  {
        self.push(element: item)
    }
    
    var count: Int { return items.count}
    
    subscript(i: Int) -> Element {
        return self.items[i]
        
    }
   var items  = [Element]()
    
   mutating  func pop()
    {
        items.removeLast()
    }
   mutating func push(element : Element)
    {
        items.append(element)
    }
    
}
extension Stack : SuffixableContainer
{
    func suffix(_ size: Int) -> Stack {
        var result = Stack()
        
        for index in (count - size)..<count {
            result.append(self[index])
        }
        
        return result
        
    }
    
    
}

extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}

extension Container where Item == Double
{
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum
    }
     
}
