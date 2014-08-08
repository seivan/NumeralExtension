## NumeralExtension

### Overview
Extending  ``Int``` with ```NumericExtension``` protocol 
Adding random, clamping and etc.

### Usage

```swift

100.randomFromZero // 52
-25.randomFromZero // -18

200.isEven // true
199.isEven // false

Double.random(min: -10, max: 100) // 44
Int.random(min: -100, max: 100) // -99

(-10).randomBetween(100) // 9
100.randomBetween(-200) // -67


(-230).clamp(min: 0, max: 100) // 0
230.clamp(min: 0, max: 100) // 100
10.clamp(min: 50, max: 100) // 50

//prints 1 to 20
var range = 20.times() { n in
  println(n)
}
//range.startIndex == 1
//range.endIndex == 20

//prints -10 to 5
range = (-10).upto(5) { n in
  println(n)
}
//range.startIndex == -10
//range.endIndex == 5

//prints 10 to -25
range = 10.downto(-25) { n in
  println(n)
}
//range.startIndex == 10
//range.endIndex == -25

``` 

### API

```swift
typealias IndexHandler = (number:Int) -> Void

protocol NumeralExtension {
  var randomFromZero:Self { get }
  var isEven:Bool { get }
  class func random(#min:Int, max:Int) -> Self
  func clamp(#min:Self, max:Self) -> Self
  func times(block:IndexHandler) -> Range<Int>
  func upto(toValue:Self, _ block:IndexHandler) -> Range<Int>
  func downto(toValue:Self, _ block:IndexHandler) -> Range<Int>
}

```


###Contact


If you end up using NumeralExtension in a project, I'd love to hear about it.

email: [seivan.heidari@icloud.com](mailto:seivan.heidari@icloud.com)  
twitter: [@seivanheidari](https://twitter.com/seivanheidari)

***

### License

NumeralExtension is © 2014 [Seivan](http://www.github.com/seivan) and may be freely
distributed under the [MIT license](http://opensource.org/licenses/MIT).
See the [`LICENSE.md`](https://github.com/seivan/NumeralExtension/blob/master/LICENSE.md) file.

*** 