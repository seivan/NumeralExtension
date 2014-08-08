import Foundation

typealias IndexHandler = (number:Int) -> Void

protocol NumeralExtension {
  var randomFromZero:Self { get }
  var isEven:Bool { get }
  class func random(#min:Int, max:Int) -> Self
  func randomBetween(toValue:Self) -> Self
  func clamp(#min:Self, max:Self) -> Self
  func times(block:IndexHandler) -> Range<Int>
  func upto(toValue:Self, _ block:IndexHandler) -> Range<Int>
  func downto(toValue:Self, _ block:IndexHandler) -> Range<Int>
}




extension Swift.Int: NumeralExtension {
  
  var isEven:Bool {  return (self % 2 == 0) }
  var randomFromZero:Int {
  let maxValue = self < 0 ? 0 : self
    let minValue = self < 0 ? self : 0
    return self.dynamicType.random(min: minValue, max: maxValue)
  }
  
  static func random(#min:Int, max:Int) -> Int {
    assert(min < max, "Minimum has to be less than the maximum")
    let count = (max - min + 1)
    return min + Int(arc4random_uniform((UInt32(count))))
  }
  
  func randomBetween(toValue:Int) -> Int {
    let minValue = toValue < self ? toValue : self
    let maxValue = toValue > self ? toValue : self
    return Int.random(min:minValue, max:maxValue)
  }

  
  func clamp(#min:Int,max:Int) -> Int {
    assert(min < max, "Minimum  has to be less than the maximum")
    var properValue = self
    if self > max { properValue = max}
    else if self < min { properValue = min }
    return properValue
  }
  
  func times(block:IndexHandler) -> Range<Int> {
    assert(self > 0, "Self to be more than 0")
    
    for var index = 1; index <= self; index += 1 {
      block(number: index)
    }
    return Range(start: 1, end: self)
  }
  
  func upto(toValue:Int, _ block:IndexHandler) -> Range<Int> {
    assert(self < toValue, "Starting value has to be less than the to-value")
    for var index = self; index <= toValue; index += 1 {
      block(number: Int(index))
    }
    return Range(start: self, end: toValue)
  }
  
  func downto(toValue:Int, _ block:IndexHandler) -> Range<Int> {
    assert(self > toValue, "Starting value has to be more than the to-value")
    for var index = self; index >= toValue; index -= 1 {
      block(number: Int(index))
    }
    return Range(start: self, end: toValue)
  }
  
  
  
  
}