//
//  IOSAppDevelopmentTests.swift
//  IOSAppDevelopmentTests
//
//  Created by Ramesh kumar penta on 10/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import XCTest
@testable import IOSAppDevelopment

class IOSAppDevelopmentTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    func testMealInitalizationSucceeds()
    {
        let ratingMeal = Meal(name: "foodItem", photo: nil, rating: 1)
        XCTAssertNotNil(ratingMeal)
        
    }
    
    func testMealInializationFails()
    {
        let emptyNameMeal = Meal(name: "", photo: nil, rating: 1)
        XCTAssertNil(emptyNameMeal)
        
        let zeroRatingMeal = Meal(name: "fooditem", photo: nil, rating: -1)
        XCTAssertNil(zeroRatingMeal)
    }

}
