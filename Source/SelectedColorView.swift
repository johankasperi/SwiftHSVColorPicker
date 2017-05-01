//
//  SelectedColorView.swift
//  SwiftHSVColorPicker
//
//  Created by johankasperi on 2015-08-20.
//

import UIKit

class SelectedColorView: UIView {
    var color: UIColor!
    
    // Describe color for VoiceOver users
    override var accessibilityLabel: String? {
        set { }
        get {
            var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0
            self.color.getRed(&red, green: &green, blue: &blue, alpha: nil)

            let colorString = NSLocalizedString("Color", comment: "Title for color")
            let redString = NSLocalizedString("Red", comment: "The color red")
            let greenString = NSLocalizedString("Green", comment: "The color green")
            let blueString = NSLocalizedString("Blue", comment: "The color blue")

            let percentFormatter = NumberFormatter()
            percentFormatter.numberStyle = .percent

            let redPercent = percentFormatter.string(from: NSNumber(floatLiteral: Double(red)))!
            let greenPercent = percentFormatter.string(from: NSNumber(floatLiteral: Double(green)))!
            let bluePercent = percentFormatter.string(from: NSNumber(floatLiteral: Double(blue)))!
            
            return "\(colorString), \(redPercent) \(redString), \(greenPercent) \(greenString), \(bluePercent) \(blueString)"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        
        setViewColor(color)
        
        // Make accessible
        self.isAccessibilityElement = true
    }
    
    func setViewColor(_ _color: UIColor) {
        color = _color
        setBackgroundColor()
    }
    
    func setBackgroundColor() {
        backgroundColor = color
    }
}
