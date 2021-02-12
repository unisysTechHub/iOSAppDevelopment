//
//  Meal.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 10/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation
import UIKit

class Meal
{
    var name : String?
    var photo : UIImage?
    var rating : Int = 0
    
    init?(name : String, photo : UIImage?, rating : Int) {
        if name.isEmpty || rating < 0
        {
           return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
}
