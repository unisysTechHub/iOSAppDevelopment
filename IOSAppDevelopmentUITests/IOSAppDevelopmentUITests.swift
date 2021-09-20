//
//  IOSAppDevelopmentUITests.swift
//  IOSAppDevelopmentUITests
//
//  Created by Ramesh kumar penta on 14/08/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import XCTest
import Combine

class IOSAppDevelopmentUITests: XCTestCase {
    override func setUp() {
        
        print("setup method called before test begins")
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Signup"]/*[[".buttons[\"Signup\"].staticTexts[\"Signup\"]",".staticTexts[\"Signup\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Signup successfull"].scrollViews.otherElements.buttons["OK"].tap()
        
      let username =  app.textFields["Enter User Name"]
        username.tap()
        username.typeText("admin1")
        
       let password = app.textFields["Enter Password"]
        password.tap()
        password.typeText("password")
        
        app.tables.cells.element(boundBy: 0).swipeLeft()
        app.tables/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables.cells.element(boundBy: 1).swipeLeft()
        app.tables/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
  }
    let app = XCUIApplication()

    func test1() throws {
        app.launch()
        navigateToSinginScreen()
        navigateToEmplistScreen(select: 0)
        
//        let cell =   app.tables["emplist"].cells.matching(identifier: "emplistCell1002").element(boundBy: 0)
//        cell.swipeLeft()
//        let flag = true
//
//            try XCTSkipIf(flag,"", file: "IOSAppDevelopmentUITests.swift",line: 78)
//
//
////        cell.cells.element(boundBy: 0).swipeLeft()
//       // cell.firstMatch.swipeLeft()
//        cell.buttons["Delete"].tap()
//
        
    }
    
    func navigateToSinginScreen() {
        let enterUserNameTextField = app.textFields["Enter User Name"]
        enterUserNameTextField.tap()
        enterUserNameTextField.typeText("admin1")
        let password = app.textFields["Enter Password"]
         password.tap()
         password.typeText("password")
         app/*@START_MENU_TOKEN@*/.staticTexts["Sign in"]/*[[".buttons[\"Sign in\"].staticTexts[\"Sign in\"]",".staticTexts[\"Sign in\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func navigateToEmplistScreen(select employeeAt : Int) {
        let cell =   app.tables["emplist"].cells.matching(identifier: "emplistCell1002").element(boundBy: 0)
        cell.swipeLeft()
        cell.buttons["Delete"].tap()

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
