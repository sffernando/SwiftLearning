//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by koudai on 2016/11/26.
//  Copyright © 2016年 fernando. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker Test
    func testMealInitialization() {
        // success case.
        let potentialItem = Meal.init(name: "Newest meal", photo: nil
            , rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // failure case
        let noName = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRationg = Meal.init(name: "Realy bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRationg, "Negative ratings are invalid, be positive")
    }
}
