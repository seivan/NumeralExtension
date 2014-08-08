//
//  TestsCGPointMathFunctions.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 06/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest
import CoreGraphics


class TestsIntNumericExtension: XCTestCase,TestNumeralExtension {

  
  func testsRandomFromZero() {

    for index in 1...10000 {
      var candidate = 5.randomFromZero
      XCTAssertLessThanOrEqual(candidate, 5)
      XCTAssertGreaterThanOrEqual(candidate, 0)

      candidate = -5.randomFromZero
      XCTAssertGreaterThanOrEqual(candidate, -5)
      XCTAssertLessThanOrEqual(candidate, 0)

    }
    
  
  }
  
  func testIsEven() {
    
    for index in 1...1000 {
      var candidate = index.isEven
      if(index % 2 == 0) {
        XCTAssert(candidate)
      }
      else {
        XCTAssertFalse(candidate)
      }
      
    }

  }
  
  func testRandom() {
    var candidate = Int.random(min: 0, max: 1)
    XCTAssertLessThanOrEqual(candidate,1)
    XCTAssertGreaterThanOrEqual(candidate,0)
    
    candidate = Int.random(min: -10, max: -9)
    XCTAssertLessThanOrEqual(candidate,-9)
    XCTAssertGreaterThanOrEqual(candidate,-10)

    candidate = Int.random(min: 50, max: 100)
    XCTAssertLessThanOrEqual(candidate,100)
    XCTAssertGreaterThanOrEqual(candidate,50)


    
  }
  
  func testRandomBetween() {
    var candidate = 0.randomBetween(1)
    XCTAssertLessThanOrEqual(candidate,1)
    XCTAssertGreaterThanOrEqual(candidate,0)
    
    candidate = Int.random(min: -10, max: -9)
    XCTAssertLessThanOrEqual(candidate,-9)
    XCTAssertGreaterThanOrEqual(candidate,-10)
    
    candidate = Int.random(min: 50, max: 100)
    XCTAssertLessThanOrEqual(candidate,100)
    XCTAssertGreaterThanOrEqual(candidate,50)
    
    
    
  }
  
  func testClamp() {
    var candidate = 100.clamp(min: 0.0, max: 50.0)
    XCTAssertEqual(candidate, 50)

    candidate = (-100).clamp(min: 0, max: 50)
    XCTAssertEqual(candidate, 0)

    candidate = (-100).clamp(min: (-200), max: 50)
    XCTAssertEqual(candidate, -100)

    candidate = 75.clamp(min: 50, max: 100)
    XCTAssertEqual(candidate, 75)
    

    
  }
  
  func testTimes() {
    var candidate = [Int]()
    let expected = 5
    XCTAssertEqual(candidate.count, 0)
    
    let range = expected.times { n in
      candidate.append(n)
    }
    
    XCTAssertEqual(candidate.count, expected)
    XCTAssertEqual(candidate[0], 1)
    XCTAssertEqual(candidate[4], 5)
    
    XCTAssertEqual(range.startIndex, 1)
    XCTAssertEqual(range.endIndex, 5)

    
  }

  func testUpTo() {
    var candidate = [Int]()
    let range = (-5).upto(5) { n in
      candidate.append(n)
    }
    
    XCTAssertEqual(candidate.count, 11)
    XCTAssertEqual(candidate[0], -5)
    XCTAssertEqual(candidate[10], 5)
    
    XCTAssertEqual(range.startIndex, -5)
    XCTAssertEqual(range.endIndex, 5)

    
    
  }
  
  func testDownTo() {
    var candidate = [Int]()
    let range = 5.downto(-5) { n in
      candidate.append(n)
    }
    
    XCTAssertEqual(candidate.count, 11)
    XCTAssertEqual(candidate[0], 5)
    XCTAssertEqual(candidate[10], -5)

    XCTAssertEqual(range.startIndex, 5)
    XCTAssertEqual(range.endIndex, -5)

    
  }

}

