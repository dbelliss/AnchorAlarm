//
//  Genre.swift
//  Pulse2Test
//
//  Created by Davey Jay Belliss on 7/23/16.
//  Copyright © 2016 Harman International. All rights reserved.
//

import UIKit

class GenreViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var genre: UIPickerView!
    @IBOutlet weak var label: UILabel!
    var pickerData: [String] = [String]()
    var currentGenre = "0"
    override func viewDidLoad() {
    
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let currentGenre = appDelegate.genre
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.genre.delegate = self
        self.genre.dataSource = self
        // Input data into the Array:
        pickerData = ["Politics", "Sports", "Technology", "Pop Culture"]
        genre.selectRow(appDelegate.genre, inComponent: 0, animated: true)

    }

    override func viewWillDisappear(animated: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.genre = genre.selectedRowInComponent(0)
        print(genre.selectedRowInComponent(0))
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