//
//  Profile.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 19/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
protocol Profile
 {
    associatedtype Item
    var userName : String {get set}
    var fullName  : String { get set }
    var age : Int {get set}
    var address : Item {get set }
        
 }
