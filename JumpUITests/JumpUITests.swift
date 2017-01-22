//
//  JumpUITests.swift
//  JumpUITests
//
//  Created by Nico Grenier on 07/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import XCTest

class JumpUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }
    
    func testMenuIsAccessibleOnStartup() {
        let app = XCUIApplication()
        XCTAssert(app.navigationBars["Menu"].exists)
        if !app.navigationBars["Menu"].isHittable {
            XCTAssert(app.buttons["Back"].exists)
        }
    }
    
    func testMenuCellCount() {
        let app = XCUIApplication()
        if !app.navigationBars["Menu"].isHittable {
            app.buttons["Back"].tap()
        }
        XCTAssert(app.tables.cells.count == 3)
    }
    
    func testShowSettingsSegue() {
        let app = XCUIApplication()
        if !app.navigationBars["Menu"].isHittable {
            app.buttons["Back"].tap()
        }
        app.tables.staticTexts["Settings"].tap()
        XCTAssert(app.navigationBars["Settings"].exists)
    }
    
    func testShowStatsSegue() {
        let app = XCUIApplication()
        if !app.navigationBars["Menu"].isHittable {
            app.buttons["Back"].tap()
        }
        app.tables.staticTexts["Stats"].tap()
        XCTAssert(app.navigationBars["Overall Stats"].exists)
    }
    
    func testShowPlaySegue() {
        let app = XCUIApplication()
        if !app.navigationBars["Menu"].isHittable {
            app.buttons["Back"].tap()
        }
        app.tables.staticTexts["Play"].tap()
        XCTAssert(app.navigationBars["Alien Survival"].exists)
    }
    
    func testShowInfoSegue() {
        let app = XCUIApplication()
        if !app.navigationBars["Menu"].isHittable {
            app.buttons["Back"].tap()
        }
        app.toolbars.buttons["ℹ️"].tap()
        XCTAssert(app.navigationBars["Info"].exists)
    }
    
    
    func testMenuAccessibleAfterSegue() {
        let app = XCUIApplication()
        if !app.navigationBars["Menu"].isHittable {
            app.buttons["Back"].tap()
        }
        app.tables.staticTexts["Settings"].tap()
        if !app.navigationBars["Menu"].exists {
            XCTAssert(app.buttons["Back"].exists)
        }
    }
    
}
