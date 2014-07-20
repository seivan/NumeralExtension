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


  
  func testsRandomFromZero() {

    for index in 1...10000 {
      var candidate = Double(5.5).sh_randomFromZero
      XCTAssertFalse(candidate.isSignMinus)
      XCTAssertLessThanOrEqual(candidate, Double(5))
      XCTAssertGreaterThanOrEqual(candidate, Double(0))

      candidate = Double(-5.5).sh_randomFromZero
      if(candidate < 0) {
        XCTAssert(candidate.isSignMinus)
      }
      XCTAssertGreaterThanOrEqual(candidate, Double(-5))
      XCTAssertLessThanOrEqual(candidate, Double(0))

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
    XCTAssertGreaterThanOrEqual(candidate,0)
    
    candidate = Double.sh_random(min: -10, max: -9)
    XCTAssertLessThanOrEqual(candidate,-9)
    XCTAssertGreaterThanOrEqual(candidate,-10)

    candidate = Double.sh_random(min: 50, max: 100)
    XCTAssertLessThanOrEqual(candidate,100)
    XCTAssertGreaterThanOrEqual(candidate,50)


    
  }
  
  func testClamp() {
    var candidate = Double(100).sh_clamp(min: 0.0, max: 50.0)
    XCTAssertEqual(candidate, 50)

    candidate = Double(-100).sh_clamp(min: 0, max: 50)
    XCTAssertEqual(candidate, 0)

    candidate = Double(-100).sh_clamp(min: (-200), max: 50)
    XCTAssertEqual(candidate, -100)

    candidate = Double(75).sh_clamp(min: 50, max: 100)
    XCTAssertEqual(candidate, 75)
    

    
  }
  
  func testTimes() {
    var candidate = [Int]()
    let expected = Double(5)
    XCTAssertEqual(candidate.count, 0)
    
    expected.sh_times { n in
      candidate.append(n)
    }
    
    XCTAssertEqual(Double(candidate.count), expected)
    XCTAssertEqual(candidate[0], 1)
    XCTAssertEqual(candidate[4], 5)
    
  }

  func testUpTo() {
    var candidate = [Int]()
    Double(-5).sh_upto(Double(5)) { n in
      candidate.append(n)
    }
    
    XCTAssertEqual(Double(candidate.count), 11)
    XCTAssertEqual(candidate[0], -5)
    XCTAssertEqual(candidate[10], 5)
    
    
  }
  
  func testDownTo() {
    var candidate = [Int]()
    Double(5).sh_downto(Double(-5)) { n in
      candidate.append(n)
    }
    
    XCTAssertEqual(Double(candidate.count), 11)
    XCTAssertEqual(candidate[0], 5)
    XCTAssertEqual(candidate[10], -5)
    
  }

}

