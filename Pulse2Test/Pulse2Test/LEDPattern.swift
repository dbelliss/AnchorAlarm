//
//  Genre.swift
//  Pulse2Test
//
//  Created by Davey Jay Belliss on 7/23/16.
//  Copyright © 2016 Harman International. All rights reserved.
//

import UIKit

class LEDPattern : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var pattern: UIPickerView!
    @IBOutlet weak var label: UILabel!
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pattern.delegate = self
        self.pattern.dataSource = self
        // Input data into the Array:
        pickerData = [ "Firework", "Traffic", "Star", "Wave", "FireFly", "Rain", "Fire", "Canvas", "Hourglass", "Ripple"]
//
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
        
    }//
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
      
    }
    

    
}