//
//  CutsomAnnnoation.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 15/09/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import Foundation
import MapKit
class CustomAnnotation: NSObject, MKAnnotation {
    
    // This property must be key-value observable, which the `@objc dynamic` attributes provide.
    @objc dynamic var coordinate: CLLocationCoordinate2D
    
    var title: String?
    
    var subtitle: String?
    
    var image: UIImage?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
}
