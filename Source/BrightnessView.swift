//
//  BrightnessView.swift
//  SwiftHSVColorPicker
//
//  Created by johankasperi on 2015-08-20.
//

import UIKit

protocol BrightnessViewDelegate: class {
   func brightnessSelected(_ brightness: CGFloat)
}

class BrightnessView: UIView {
  
    weak var delegate: BrightnessViewDelegate?
  
    var colorLayer: CAGradientLayer!
    
    var point: CGPoint!
    var indicator = CAShapeLayer()
    var indicatorColor: CGColor = UIColor.lightGray.cgColor
    var indicatorBorderWidth: CGFloat = 2.0
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        
        // Init the point at the correct position
        point = getPointFromColor(color)
        
        // Clear the background
        backgroundColor = UIColor.clear
        
        // Create a gradient layer that goes from black to white
        // Create a gradient layer that goes from black to white
        var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0
        let ok: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        if (!ok) {
            print("SwiftHSVColorPicker: exception <The color provided to SwiftHSVColorPicker is not convertible to HSV>")
        }
        colorLayer = CAGradientLayer()
        colorLayer.colors = [
            UIColor.black.cgColor,
            UIColor(hue: hue, saturation: saturation, brightness: 1, alpha: 1).cgColor
        ]
        colorLayer.locations = [0.0, 1.0]
        colorLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        colorLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        colorLayer.frame = CGRect(x: 0, y: 2, width: self.frame.size.width, height: 24)
        // Insert the colorLayer into this views layer as a sublayer
        self.layer.insertSublayer(colorLayer, below: layer)
        
        // Add the indicator
        indicator.strokeColor = indicatorColor
        indicator.fillColor = indicatorColor
        indicator.lineWidth = indicatorBorderWidth
        self.layer.addSublayer(indicator)
        
        drawIndicator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchHandler(touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchHandler(touches)
    }
    
    func touchHandler(_ touches: Set<UITouch>) {
        // Set reference to the location of the touchesMoved in member point
        if let touch = touches.first {
            point = touch.location(in: self)
        }
        
        point.y = self.frame.height/2
        point.x = getXCoordinate(point.x)
        // Notify delegate of the new brightness
        delegate?.brightnessSelected(getBrightnessFromPoint())
        
        drawIndicator()
    }
    
    func getXCoordinate(_ coord: CGFloat) -> CGFloat {
        // Offset the x coordinate to fit the view
        if (coord < 1) {
            return 1
        }
        if (coord > frame.size.width - 1 ) {
            return frame.size.width - 1
        }
        return coord
    }
    
    func drawIndicator() {
        // Draw the indicator
        if (point != nil) {
            indicator.path = UIBezierPath(roundedRect: CGRect(x: point.x-3, y: 0, width: 6, height: 28), cornerRadius: 3).cgPath
        }
    }
    
    func getBrightnessFromPoint() -> CGFloat {
        // Get the brightness value for a given point
        return point.x/self.frame.width
    }
    
    func getPointFromColor(_ color: UIColor) -> CGPoint {
        // Update the indicator position for a given color
        var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0
        let ok: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        if (!ok) {
            print("SwiftHSVColorPicker: exception <The color provided to SwiftHSVColorPicker is not convertible to HSV>")
        }

        return CGPoint(x: brightness * frame.width, y: frame.height / 2)
    }
    
    func setViewColor(_ color: UIColor!) {
        // Update the Gradient Layer with a given color
        var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0
        let ok: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        if (!ok) {
            print("SwiftHSVColorPicker: exception <The color provided to SwiftHSVColorPicker is not convertible to HSV>")
        }
        colorLayer.colors = [
            UIColor.black.cgColor,
            UIColor(hue: hue, saturation: saturation, brightness: 1, alpha: 1).cgColor
        ]
    }
}
