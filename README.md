[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

# SwiftHSVColorPicker

## Description
![alt tag](https://raw.github.com/johankasperi/SwiftHSVColorPicker/master/screenshot.png)<br>
Simple HSV Color Picker for iOS made in Swift. Includes a Hue and Saturation wheel, Brightness slider and a UIView for displaying the selected color.

## Installation
Manual:
<pre>
Copy the contents of "Source" to your project.
</pre>

CocoaPods:
```ruby
pod 'SwiftHSVColorPicker'
```

## How to use
Add a UIView of subclass "SwiftHSVColorPicker" to your storyboard or create it programmatically:
```swift
let colorPicker = SwiftHSVColorPicker(frame: CGRectMake(10, 20, 300, 400))
self.view.addSubview(colorPicker)
```
After adding the Color Picker to your project, initialize your SwiftHSVColorPicker by calling:
```swift
colorPicker.setViewColor(UIColor.redColor())
```
This will create all the objects of the Color Picker and set they're initial value to red.

## Example project
Please download and run "SwiftHSVColorPickerExample" for example usage.

## License
SwiftHSVColorPicker is available under the MIT license. See the LICENSE file for more info.

## Author
Johan Kasperi<br>
[@johankasperi](http://twitter.com/johankasperi)<br>
[kspri.se](http://kspri.se)
