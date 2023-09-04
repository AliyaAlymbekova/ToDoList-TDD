//
//  ToDoList_TDDUITests.swift
//  ToDoList+TDDUITests
//
//  Created by darmaraht on 22/8/23.
//

import XCTest

class ToDoList_TDDUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
        
    }

    override func tearDownWithError() throws {
    }

        func testExample() throws {

            app.navigationBars["Tasks"].buttons["Add"].tap()
            
            let titleTextField =  app.textFields["Title"]
            titleTextField.tap()
            titleTextField.typeText("Foo")
            XCTAssert(titleTextField.exists)
            
            let locationTextField = app.textFields["Location"]
            locationTextField.tap()
            locationTextField.typeText("Bar")
            XCTAssert(locationTextField.exists)
            
            let descriptionTextField = app.textFields["Description"]
            descriptionTextField.tap()
            descriptionTextField.typeText("Baz")
            XCTAssert(descriptionTextField.exists)
                        
            let dateTextField = app.textFields["Date"]
            dateTextField.tap()
            dateTextField.typeText("28.08.23")
            XCTAssert(dateTextField.exists)
            
            let addressTextField = app.textFields["Address"]
            addressTextField.tap()
            addressTextField.typeText("Bishkek")
            XCTAssert(addressTextField.exists)

            let saveButton = app.buttons["Save"]
            saveButton.tap()
            XCTAssert(saveButton.exists)
            
                
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
