//
//  Entities.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 19/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func appMainStoreContext() -> NSManagedObjectContext
{
    return ((UIApplication.shared.delegate  as? AppDelegate)?.persistentContainer.viewContext)!

}
func appMainStoreBackgroundContext() -> NSManagedObjectContext
{
    return ((UIApplication.shared.delegate  as? AppDelegate)?.persistentContainer.newBackgroundContext())!

}
 func EmployeeEntitiy() -> NSEntityDescription
 {
      return (NSEntityDescription.entity(forEntityName: "Employee", in: appMainStoreContext()))!
 }

func EmpEnitityManagedObject() -> NSManagedObject
{
   return NSManagedObject(entity: EmployeeEntitiy(), insertInto: appMainStoreContext()) as NSManagedObject
}

struct EmployeeModel {
    var id : Int
    var name : String
    var address : String
}

