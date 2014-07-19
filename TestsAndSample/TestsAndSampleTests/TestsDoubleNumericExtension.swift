//
//  TestsCGPointMathFunctions.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 06/07/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import XCTest
import CoreGraphics


class TestsDoubleNumericExtension: XCTestCase,TestSHNumericExtension {

  func testRadiansToDegrees() {
    let candidate = 50.55.sh_radiansToDegrees
    let expected:Double = 2896.30165438631
    XCTAssertEqualWithAccuracy(expected, candidate, 0.00000000001)
  }
  
  func testDegreesToRadians() {
    let candidate = 2896.30165438631.sh_degreesToRadians
    let expected:Double = 50.55
    XCTAssertEqualWithAccuracy(expected, candidate, 0.000000000001)
    
  }
  func testsRandomFromZero() {

    for index in 1...10000 {
      var candidate = Double(5).sh_randomFromZero
      XCTAssertFalse(candidate.isSignMinus)
      XCTAssertLessThanOrEqual(candidate, 5)
    }
    
    for index in 1...1000 {
      var candidate = Double(-5).sh_randomFromZero
      if(candidate < 0) {
        XCTAssert(candidate.isSignMinus)
      }
      XCTAssertGreaterThanOrEqual(candidate, -5)
    }


    
  }
  func testIsEven() {
    
    for index in 1...1000 {
      var candidate = Double(index).sh_isEven
      if(index % 2 == 0) {
        XCTAssert(candidate)
      }
      else {
        XCTAssertFalse(candidate)
      }
      
    }
    
    
  }
  func testRandom() {
    var candidate = Double.sh_random(min: 0, max: 1)
    XCTAssertLessThanOrEqual(candidate,1)
    candidate = Double.sh_random(min: 0, max: 1)
    XCTAssert(candidate <= 1 || candidate >= 0)
    candidate = Double.sh_random(min: -10, max: -9)
    XCTAssert(candidate >= -10 && candidate <= -9)

    
  }
  func testClamp() {
    var candidate = 100.sh_clamp(min: 0, max: 50)
    XCTAssertEqual(candidate, 50)

    candidate = (-100).sh_clamp(min: 0, max: 50)
    XCTAssertEqual(candidate, 0)

    candidate = (-100).sh_clamp(min: (-200), max: 50)
    XCTAssertEqual(candidate, -100)

    candidate = 75.sh_clamp(min: 50, max: 100)
    XCTAssertEqual(candidate, 75)
    

    
  }
  func testTimes() {
    var candidate = [Int]()
    let expected = Double(5)
    XCTAssertEqual(candidate.count, 0)
    
    expected.sh_times {
      candidate.append(1)
    }
    
    XCTAssertEqual(Double(candidate.count), expected)
    
    
  }
  func testTimesWithIndex() {
    var candidate = [Int]()
    let expected = 10
    XCTAssertEqual(candidate.count, 0)
    

    expected.sh_times() { (index:Int) in
      candidate.append(index)
    }
    
    XCTAssertEqual(candidate.count, expected)
    XCTAssertEqual(candidate[0], 1)
    XCTAssertEqual(candidate[9], 10)

    
  }
  func testUpTo() {
    
  }
  func testDownTo() {
    
  }

}

