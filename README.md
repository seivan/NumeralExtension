## NumeralExtension

### Overview
Extending  ```Double```  and ```Int``` with the protocol ```NumericExtension```
Adding random, clamping and numerical list comprehension.


>To get better interoperability between 32 and 64-bit numerical types use 
* [ScalarArithmetic](https://github.com/seivan/ScalarArithmetic)

### Usage

```swift

100.sh_randomFromZero // 52
-25.sh_randomFromZero // -18

200.sh_isEven // true
199.sh_isEven // false

Double.sh_random(min: -10, max: 100) // 44
Int.sh_random(min: -100, max: 100) // -99


(-230).sh_clamp(min: 0, max: 100) // 0
230.sh_clamp(min: 0, max: 100) // 100
10.sh_clamp(min: 50, max: 100) // 50

//prints 1 to 20
var range = 20.sh_times() { n in
  println(n)
}
//range.startIndex == 1
//range.endIndex == 20

//prints -10 to 5
range = (-10).sh_upto(5) { n in
  println(n)
}
//range.startIndex == -10
//range.endIndex == 5

//prints 10 to -25
range = 10.sh_downto(-25) { n in
  println(n)
}
//range.startIndex == 10
//range.endIndex == -25

``` 

### API

```swift
typealias IndexHandler = (number:Int) -> Void

protocol NumeralExtension {
  var sh_randomFromZero:Self { get }
  var sh_isEven:Bool { get }
  class func sh_random(#min:Int, max:Int) -> Self
  func sh_clamp(#min:Self, max:Self) -> Self
  func sh_times(block:IndexHandler) -> Range<Int>
  func sh_upto(toValue:Self, _ block:IndexHandler) -> Range<Int>
  func sh_downto(toValue:Self, _ block:IndexHandler) -> Range<Int>
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