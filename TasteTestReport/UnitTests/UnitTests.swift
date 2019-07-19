//
//  UnitTests.swift
//  UnitTests
//
//  Created by Amorphant on 7/14/19.
//  Copyright © 2019 LaCroix. All rights reserved.
//

import XCTest

class UnitTests: XCTestCase {
    
    func testTasterVote_properties() {
        var sut = TasterVote("ScoreTest 0")
        XCTAssert(sut.flavor == "ScoreTest")
        XCTAssert(sut.rank == 0)
        XCTAssert(sut.score == 0)
        
        sut = TasterVote("Score Test 1")
        XCTAssert(sut.flavor == "Score Test")
        XCTAssert(sut.rank == 1)
        XCTAssert(sut.score == 5)
        
        sut = TasterVote("ScoreTest 2")
        XCTAssert(sut.rank == 2)
        XCTAssert(sut.score == 3)
        
        sut = TasterVote("ScoreTest 3")
        XCTAssert(sut.rank == 3)
        XCTAssert(sut.score == 2)
        
        sut = TasterVote("ScoreTest 4")
        XCTAssert(sut.rank == 4)
        XCTAssert(sut.score == 1)
        
        sut = TasterVote("ScoreTest 5")
        XCTAssert(sut.rank == 5)
        XCTAssert(sut.score == 0)
        
        sut = TasterVote("ScoreTest 6")
        XCTAssert(sut.rank == 6)
        XCTAssert(sut.score == 0)
    }
    
    func testFlavorScoreManager_output() {
        let sut = FlavorScoreManager(fullPathName: "")
        sut.sourceData = ["Foo TwoWords 1",
                          "Bar 2",
                          "Baz 2",
                          "Qux 3",
                          "Foo TwoWords 4",
                          "Bar 5",
                          "Baz 2",
                          "Qux 1"]
        let output = sut.output()
        
        XCTAssert(output.count == 4)
        
        XCTAssert(output[0].key == "Qux")
        XCTAssert(output[0].value == 7)
        
        XCTAssert(output[1].key == "Baz")
        XCTAssert(output[1].value == 6)
        
        XCTAssert(output[2].key == "Foo TwoWords")
        XCTAssert(output[2].value == 6)
        
        XCTAssert(output[3].key == "Bar")
        XCTAssert(output[3].value == 3)
    }
}
