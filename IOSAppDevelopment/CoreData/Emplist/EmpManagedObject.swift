//
//  EmpManagedObject.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 19/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import CoreData

class EmpManagedObject : NSManagedObject
{
    
    @NSManaged public var name: String?
    @NSManaged public var  id: Int
    
    
     func fetchRequest() -> NSFetchRequest<EmpManagedObject> {
        return NSFetchRequest<EmpManagedObject>(entityName: "Employee");
    }

    
}


