//
//  plasticfishes_mvcTests.swift
//  plasticfishes-mvcTests
//
//  Created by Luis Ezcurdia on 9/14/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import XCTest
@testable import plasticfishes_mvc

class plasticfishes_mvcTests: XCTestCase {

    func testFishes() {
        let result = FishService.shared.all()
        XCTAssertEqual(14, result.count)

        let fish = result.first!

        XCTAssertEqual("red-eaten", fish.id)
        XCTAssertEqual("Red eaten", fish.name)
        XCTAssertEqual("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", fish.text)
        XCTAssertEqual("http://plasticfishes.herokuapp.com/api/fishes/red-eaten", fish.apiUrlString)
        XCTAssertEqual("http://plasticfishes.herokuapp.com/fishes/red-eaten", fish.webUrlString)
        XCTAssertEqual("http://plasticfishes.herokuapp.com/red-eaten.png", fish.imageUrlString)
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
