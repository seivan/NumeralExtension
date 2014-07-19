import Foundation


typealias SHIndexClosure = (index:Int) -> Void

protocol SHNumericExtension {
  var sh_radiansToDegrees:Double { get }
  var sh_degreesToRadians:Double { get }
  var sh_randomFromZero:Self { get }
  var sh_isEven:Bool { get }
  class func sh_random(#min:Self, max:Self) -> Self
  func sh_clamp(#min:Self, max:Self) -> Self
  func sh_times(block:()->())
  func sh_times(block:SHIndexClosure)
  func sh_upto(toValue:Int, _ block:SHIndexClosure)
  func sh_downto(toValue:Int, _ block:SHIndexClosure)
}


extension Double: SHNumericExtension {

  var sh_radiansToDegrees:Double { return self * 180 / M_PI }
  var sh_degreesToRadians:Double { return self * M_PI / 180 }
  var sh_isEven:Bool {  return (self % 2 == 0) }
  var sh_randomFromZero:Double {
    let isMinus = self.isSignMinus
    let maxValue = isMinus ? 0 : self
    let minValue = isMinus ? self : 0
    return self.dynamicType.sh_random(min: minValue, max: maxValue)
  }

  static func sh_random(#min:Double, max:Double) -> Double {
    assert(min < max, "Minimum has to less than the maximum")
    return min + Double(arc4random()) % (max - min + 1);
  }

  func sh_clamp(#min:Double,max:Double) -> Double {
    assert(min < max, "Minimum  has to be less than the maximum")
    var properValue = self
    if self > max { properValue = max}
    else if self < min { properValue = min }
    return properValue
  }
  
  func sh_times(block:()->()) {
    self.sh_times() { (index:Int) in
      block()
    }
  }
  func sh_times(block:SHIndexClosure) {
    assert(self > 0, "Self to be more than 0")
    for var index:Int = 1; index <= Int(self); index += 1 {
      block(index: Int(index))
    }
  }
  
  func sh_upto(toValue:Int, _ block:SHIndexClosure) {
    assert(Int(self) < toValue, "Starting value has to be less than the to-value")
    for var index:Int = Int(self); index <= Int(self); index += 1 {
      block(index: Int(index))
    }
  }

  func sh_downto(toValue:Int, _ block:SHIndexClosure) {
    assert(Int(self) > toValue, "Starting value has to be more than the to-value")
    for var index:Int = Int(self); index >= Int(self); index -= 1 {
      block(index: Int(index))
    }
  }
  

  
}

extension Int: SHNumericExtension {
  
  var sh_radiansToDegrees:Double { return Double(self) * 180 / M_PI }
  var sh_degreesToRadians:Double { return Double(self) * M_PI / 180 }
  var sh_isEven:Bool {  return (self % 2 == 0) }
  var sh_randomFromZero:Int {
    let maxValue = self < 0 ? 0 : self
    let minValue = self < 0 ? self : 0
    return self.dynamicType.sh_random(min: minValue, max: maxValue)
  }
  
  static func sh_random(#min:Int, max:Int) -> Int {
    assert(min < max, "Minimum has to be less than the maximum")
    return min + Int(arc4random()) % (max - min + 1);
  }
  
  func sh_clamp(#min:Int,max:Int) -> Int {
    assert(min < max, "Minimum  has to be less than the maximum")
    var properValue = self
    if self > max { properValue = max}
    else if self < min { properValue = min }
    return properValue
  }
  
  func sh_times(block:()->()) {
    self.sh_times() { (index:Int) in
      block()
    }
  }
  func sh_times(block:SHIndexClosure) {
    assert(self > 0, "Self to be more than 0")
    for index in 1...self {
      block(index: Int(index))
    }
  }
  
  func sh_upto(toValue:Int, _ block:SHIndexClosure) {
    assert(self < toValue, "Starting value has to be less than the to-value")
    for index in Int(self+1)...toValue {
      block(index: Int(index))
    }
  }
  
  func sh_downto(toValue:Int, _ block:SHIndexClosure) {
    assert(self > toValue, "Starting value has to be more than the to-value")
    var reversed = [Int]()
    toValue.sh_upto(self) { index in
      reversed.append(index)
    }
    for index in reversed.reverse()  {
      block(index: Int(index))
    }
  }
  
  
  
}