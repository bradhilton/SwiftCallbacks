//
//  ExampleUITests.swift
//  ExampleUITests
//
//  Created by Bradley Hilton on 11/15/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import XCTest

class ExampleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testExample() {
        let app = XCUIApplication()
        app.buttons["Button"].tap()
        app.navigationBars["Example.View"].buttons["Item"].tap()
        app.navigationBars["Example.View"].buttons["Second Item"].tap()
    }
    
}
