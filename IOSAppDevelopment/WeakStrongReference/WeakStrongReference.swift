//
//  WeakStrongReference.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 12/02/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import Foundation
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned var customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}
//var john: Customer?
//john = Customer(name: "John Appleseed")
//john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
//john = nil

class Parent {
    var name : String
    var child : [Child]?
    init(name: String){
        self.name = name
    }
    deinit {
        print("\(name) parent deinit")
    }
    
}
class Child {
    var name : String
    unowned var parent : Parent?
    init(name : String, parent : Parent) {
        self.name = name
        self.parent = parent
    }
    deinit {
        print("\(name) deinit")
    }
}

//var ramesh: Parent?
//var unit4A: Child?
//ramesh = Parent(name: "Ramesh")
//
//ramesh!.child = [Child(name: "Rohita", parent: ramesh!), Child(name: "Avinash", parent: ramesh!)]
//
//ramesh = nil
