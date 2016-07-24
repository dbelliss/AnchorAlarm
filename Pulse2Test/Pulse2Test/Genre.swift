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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.genre.delegate = self
        self.genre.dataSource = self
        // Input data into the Array:
        pickerData = ["Politics", "Sports", "Dunkey", "Item 4", "Item 5", "Item 6"]
        
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

    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        // Do any additional setup after loading the view, typically from a nib.
    //    }
    //
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    //
    //    func tableView(tableView:UITableView!, numberOfRowsInSection section:Int) -> Int
    //    {
    //        return 20
    //    }
    //
    //    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    //    {
    //        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "mycell")
    //        cell.textLabel!.text="row#\(indexPath.row)"
    //        cell.detailTextLabel!.text="subtitle#\(indexPath.row)"
    //        
    //        return cell
    //    }
}