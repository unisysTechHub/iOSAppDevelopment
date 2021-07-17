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

//  ARC automatic reference counting
//when object reference assinged to property, varaible, constant,
 //swift maintains ARC refrence. Memory allocated for the object will be deallocated only when ARC of the object is zero.
//  when class has dependency on other objects.
//  check for existance of object, without a property - that property can be weak reference.
//  if object doesn't exist without existance of the propery - both object and property has same life time - whenever dependency has deallcoated, all objects has reference dependency objects will be deallocated.
    // then dependency must be unowned reference

    // CreditCard has dependency on Customer, CreditCard instance doesn't exist without customer intannce. CreditCard object has unowned reference to customer. so that when customer object is deallocated, credit card instance will be deallocated.
  //   when closure is assinged to property of the class and the closure access instance variable of the class.  ARC of object is 1 -  object can be deallocated unless closure instance is deallocated. Since closure has refrence to self reference - closure can be deallcoated first.
   // So defining capture list - { [unowned self, weak delegae = self.delegate] (a, b) in return a + b}
