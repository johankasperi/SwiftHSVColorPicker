//
//  ViewController.swift
//  SwiftHSVColorPicker
//
//  Created by johankasperi on 2015-08-20.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    // Init ColorPicker with yellow
    var selectedColor: UIColor = UIColor.yellowColor()
    
    // IBOutlet for the ColorPicker
    @IBOutlet var colorPicker: ColorPicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Setup Color Picker
        colorPicker.setViewColor(selectedColor)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getSelectedColor(sender: UIButton) {
        // Get the selected color from the Color Picker.
        let selectedColor = colorPicker.color
        
        println(selectedColor)
    }
}

