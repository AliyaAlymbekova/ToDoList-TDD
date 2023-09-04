//
//  DetailViewControllerTests.swift
//  ToDoList+TDDTests
//
//  Created by darmaraht on 28/8/23.
//

import XCTest
import CoreLocation
@testable import ToDoList_TDD

class DetailViewControllerTests: XCTestCase {
    
    var sut: DetailViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController
        sut.loadViewIfNeeded()    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }
    
    func testHasTitleLabel() {
        
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertTrue(sut.titleLabel.isDescendant(of: sut.view))
    }
    
    func testHasDescriptionLabel() {
        
        XCTAssertNotNil(sut.descriptionLabel)
        XCTAssertTrue(sut.descriptionLabel.isDescendant(of: sut.view))
    }
    
    func testHasDateLabel() {
        
        XCTAssertNotNil(sut.dateLabel)
        XCTAssertTrue(sut.dateLabel.isDescendant(of: sut.view))
    }
    
    func testHasLocationLabel() {
        
        XCTAssertNotNil(sut.locationLabel)
        XCTAssertTrue(sut.locationLabel.isDescendant(of: sut.view))
    }
    
    func testHasMapView() {
        
        XCTAssertNotNil(sut.mapView)
        XCTAssertTrue(sut.mapView.isDescendant(of: sut.view))
    }
    
    func setUpTaskAndApperanceTransition() {
        let coordinate = CLLocationCoordinate2D(latitude: 42.8766532, longitude: 74.5864258)
        let location = Location(name: "Baz", coordinate: coordinate)
        let date = Date(timeIntervalSince1970: 1693222149)
        let task = Task(title: "Foo", description: "Bar", date: date, location: location)
        sut.task = task
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
    }
    
    func testSettingTaskSetsTitleLabel() {
        setUpTaskAndApperanceTransition()
        XCTAssertEqual(sut.titleLabel.text, "Foo")
    }
    
    func testSettingTaskSetsDescriptionLabel() {
        setUpTaskAndApperanceTransition()
        XCTAssertEqual(sut.descriptionLabel.text, "Bar")
    }
    
    func testSettingTaskSetsLocationLabel() {
        setUpTaskAndApperanceTransition()
        XCTAssertEqual(sut.locationLabel.text, "Baz")
    }

    func testSettingTaskSetsDateLabel() {
        setUpTaskAndApperanceTransition()
        XCTAssertEqual(sut.dateLabel.text, "28.08.23")
    }
    
    func testSettingTaskSetsMapView() {
        setUpTaskAndApperanceTransition()
        XCTAssertEqual(sut.mapView.centerCoordinate.latitude, 42.8766532,
                       accuracy: 0.001)
        XCTAssertEqual(sut.mapView.centerCoordinate.longitude, 74.5864258,
                       accuracy: 0.001)

    }
}
