import Foundation

typealias SHIndexHandler = (number:Int) -> Void

protocol NumeralExtension {
  var sh_randomFromZero:Self { get }
  var sh_isEven:Bool { get }
  class func sh_random(#min:Int, max:Int) -> Self
  func sh_randomBetween(toValue:Self) -> Self
  func sh_clamp(#min:Self, max:Self) -> Self
  func sh_times(block:SHIndexHandler) -> Range<Int>
  func sh_upto(toValue:Self, _ block:SHIndexHandler) -> Range<Int>
  func sh_downto(toValue:Self, _ block:SHIndexHandler) -> Range<Int>
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
  
  func sh_times(block:SHIndexHandler) -> Range<Int> {
    assert(self > 0, "Self to be more than 0")
    
    for var index = 1; index <= self; index += 1 {
      block(number: index)
    }
    return Range(start: 1, end: self)
  }
  
  func sh_upto(toValue:Int, _ block:SHIndexHandler) -> Range<Int> {
    assert(self < toValue, "Starting value has to be less than the to-value")
    for var index = self; index <= toValue; index += 1 {
      block(number: Int(index))
    }
    return Range(start: self, end: toValue)
  }
  
  func sh_downto(toValue:Int, _ block:SHIndexHandler) -> Range<Int> {
    assert(self > toValue, "Starting value has to be more than the to-value")
    for var index = self; index >= toValue; index -= 1 {
      block(number: Int(index))
    }
    return Range(start: self, end: toValue)
  }
  
  
  
  
}