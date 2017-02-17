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
    var selectedColor: UIColor = UIColor.white
    
    // IBOutlet for the ColorPicker
    @IBOutlet var colorPicker: SwiftHSVColorPicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Setup Color Picker
        colorPicker.setViewColor(selectedColor)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getSelectedColor(_ sender: UIButton) {
        // Get the selected color from the Color Picker.
        let selectedColor = colorPicker.color
        
        print(selectedColor)
    }
}
