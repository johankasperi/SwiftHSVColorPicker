# SwiftHSVColorPicker

## Description
![alt tag](https://raw.github.com/johankasperi/SwiftHSVColorPicker/master/screenshot.png)
Simple HSV Color Picker for iOS made in Swift. Includes a Hue and Saturation wheel, Brightness slider and a UIView for displaying the selected color.

## Installation
Manual:
<pre>
Copy the contents of "Source" to your project.
</pre>

Cocoapods:
```ruby
pod 'SwiftHSVColorPicker'
```

## How to use
1. Add a UIView of subclass "ColorPicker" to your storyboard or create it programmatically:
```swift
let colorPicker = ColorPicker(frame: CGRectMake(0, 0, 300, 400))
self.view.addSubview(colorPicker2)
```
2. In your view controller, initialize your ColorPicker by calling:
```swift
colorPicker.setViewColor(UIColor.redColor())
```
This will create all the objects of the Color Picker and set they're initial value to red.

## Example project
Please download and run SwiftHSVColorPickerExample for example usage.

## Author
Johan Kasperi
[@johankasperi](http://twitter.com/johankasperi)
[kspri.se](http://kspri.se)

## License
SwiftHSVColorPicker is available under the MIT license. See the LICENSE file for more info.