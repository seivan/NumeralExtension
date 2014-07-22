import Foundation

typealias IndexHandler = (number:Int) -> Void

protocol NumeralExtension {
  var sh_randomFromZero:Self { get }
  var sh_isEven:Bool { get }
  class func sh_random(#min:Int, max:Int) -> Self
  func sh_randomBetween(toValue:Self) -> Self
  func sh_clamp(#min:Self, max:Self) -> Self
  func sh_times(block:IndexHandler) -> Range<Int>
  func sh_upto(toValue:Self, _ block:IndexHandler) -> Range<Int>
  func sh_downto(toValue:Self, _ block:IndexHandler) -> Range<Int>
}


extension Swift.Double: NumeralExtension {
  
  var sh_isEven:Bool {  return (self % 2 == 0) }
  var sh_randomFromZero:Double {
  let isMinus = self.isSignMinus
    let maxValue = isMinus ? 0 : self
    let minValue = isMinus ? self : 0
    return self.dynamicType.sh_random(min: Int(minValue), max: Int(maxValue))
  }
  
  static func sh_random(#min:Int, max:Int) -> Double {
    assert(min < max, "Minimum has to less than the maximum")
    let count = (max - min + 1)
    return Double(min + Int(arc4random_uniform((UInt32(count)))))

  }
  
  func sh_randomBetween(toValue:Double) -> Double {
    let minValue = toValue < self ? toValue : self
    let maxValue = toValue > self ? toValue : self
    return Double.sh_random(min:Int(minValue), max:Int(maxValue))
  }
  
  func sh_clamp(#min:Double,max:Double) -> Double {
    assert(min < max, "Minimum  has to be less than the maximum")
    var properValue = self
    if self > max { properValue = max}
    else if self < min { properValue = min }
    return properValue
  }
  
  func sh_times(block:IndexHandler) -> Range<Int> {
    assert(self > 0, "Self to be more than 0")
    for var index = 1; index <= Int(self); index += 1 {
      block(number: index)
    }
    return Range(start: 1, end: Int(self))
  }
  
  func sh_upto(toValue:Double, _ block:IndexHandler) -> Range<Int> {
    assert(self < toValue, "Starting value has to be less than the to-value")
    for var index = Int(self); index <= Int(toValue); index += 1 {
      block(number: index)
    }
    return Range(start:Int(self), end:Int(toValue))
  }
  
  func sh_downto(toValue:Double, _ block:IndexHandler) -> Range<Int> {
    assert(self > toValue, "Starting value has to be more than the to-value")
    for var index = Int(self); index >= Int(toValue); index -= 1 {
      block(number: index)
    }
    return Range(start: Int(self), end: Int(toValue))
  }
  
}

import CoreGraphics
extension CGFloat: NumeralExtension {
  
  var sh_isEven:Bool {  return (self % 2 == 0) }
  var sh_randomFromZero:CGFloat {
  let isMinus = self.isSignMinus
    let maxValue = isMinus ? 0 : self
    let minValue = isMinus ? self : 0
    return self.dynamicType.sh_random(min: Int(minValue), max: Int(maxValue))
  }
  
  static func sh_random(#min:Int, max:Int) -> CGFloat {
    assert(min < max, "Minimum has to less than the maximum")
    let count = (max - min + 1)
    return CGFloat(min + Int(arc4random_uniform((UInt32(count)))))

  }
  
  func sh_randomBetween(toValue:CGFloat) -> CGFloat {
    let minValue = toValue < self ? toValue : self
    let maxValue = toValue > self ? toValue : self
    return CGFloat.sh_random(min:Int(minValue), max:Int(maxValue))
  }
  
  func sh_clamp(#min:CGFloat,max:CGFloat) -> CGFloat {
    assert(min < max, "Minimum  has to be less than the maximum")
    var properValue = self
    if self > max { properValue = max}
    else if self < min { properValue = min }
    return properValue
  }
  
  func sh_times(block:IndexHandler) -> Range<Int> {
    assert(self > 0, "Self to be more than 0")
    for var index = 1; index <= Int(self); index += 1 {
      block(number: index)
    }
    return Range(start: 1, end: Int(self))
  }
  
  func sh_upto(toValue:CGFloat, _ block:IndexHandler) -> Range<Int> {
    assert(self < toValue, "Starting value has to be less than the to-value")
    for var index = Int(self); index <= Int(toValue); index += 1 {
      block(number: index)
    }
    return Range(start:Int(self), end:Int(toValue))
  }
  
  func sh_downto(toValue:CGFloat, _ block:IndexHandler) -> Range<Int> {
    assert(self > toValue, "Starting value has to be more than the to-value")
    for var index = Int(self); index >= Int(toValue); index -= 1 {
      block(number: index)
    }
    return Range(start: Int(self), end: Int(toValue))
  }
  
  
  
}

extension Swift.Int: NumeralExtension {
  
  var sh_isEven:Bool {  return (self % 2 == 0) }
  var sh_randomFromZero:Int {
  let maxValue = self < 0 ? 0 : self
    let minValue = self < 0 ? self : 0
    return self.dynamicType.sh_random(min: minValue, max: maxValue)
  }
  
  static func sh_random(#min:Int, max:Int) -> Int {
    assert(min < max, "Minimum has to be less than the maximum")
    let count = (max - min + 1)
    return min + Int(arc4random_uniform((UInt32(count))))
  }
  
  func sh_randomBetween(toValue:Int) -> Int {
    let minValue = toValue < self ? toValue : self
    let maxValue = toValue > self ? toValue : self
    return Int.sh_random(min:minValue, max:maxValue)
  }

  
  func sh_clamp(#min:Int,max:Int) -> Int {
    assert(min < max, "Minimum  has to be less than the maximum")
    var properValue = self
    if self > max { properValue = max}
    else if self < min { properValue = min }
    return properValue
  }
  
  func sh_times(block:IndexHandler) -> Range<Int> {
    assert(self > 0, "Self to be more than 0")
    
    for var index = 1; index <= self; index += 1 {
      block(number: index)
    }
    return Range(start: 1, end: self)
  }
  
  func sh_upto(toValue:Int, _ block:IndexHandler) -> Range<Int> {
    assert(self < toValue, "Starting value has to be less than the to-value")
    for var index = self; index <= toValue; index += 1 {
      block(number: Int(index))
    }
    return Range(start: self, end: toValue)
  }
  
  func sh_downto(toValue:Int, _ block:IndexHandler) -> Range<Int> {
    assert(self > toValue, "Starting value has to be more than the to-value")
    for var index = self; index >= toValue; index -= 1 {
      block(number: Int(index))
    }
    return Range(start: self, end: toValue)
  }
  
  
  
  
}