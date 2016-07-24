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
        
        g_ledPatternID = HMNPattern(rawValue:row)!
        if g_ledPatternID ==  HMNPattern.FireFly || g_ledPatternID == HMNPattern.Canvas {
            let imageMatrix = [
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	1,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	1,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,
                0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0
            ];
            
            var array = [NSNumber]()
            for (var i = 0; i < LED_COUNT; i++) {
                array.append(imageMatrix[i])
            }
            HMNLedControl.setLedPattern(g_ledPatternID, withData: array)
        }
        else {
            HMNLedControl.setLedPattern(g_ledPatternID, withData: nil)
        }
        MainTableViewControllerShared.ledInfoLabel.text = LEDPatternNames[g_ledPatternID.rawValue]

        
        return pickerData[row]
        
      
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = pickerData[row]
        
    }
   }