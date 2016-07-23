//
//  MainTableViewController.swift
//  Pulse2Test
//
//  Created by Seonman Kim on 12/10/15.
//  Copyright © 2015 Harman International. All rights reserved.
//

import UIKit

let LEDPatternNames = [ "Firework", "Traffic", "Star", "Wave", "FireFly", "Rain", "Fire", "Canvas", "Hourglass", "Ripple"]

var g_ledPatternID = HMNPattern.Firework

var MainTableViewControllerShared: MainTableViewController!
class MainTableViewController: UITableViewController {


    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var productIDLabel: UILabel!
    @IBOutlet weak var moduleIDLabel: UILabel!
    @IBOutlet weak var batteryChargingStatusLabel: UILabel!
    @IBOutlet weak var batteryLevelLabel: UILabel!
    
    @IBOutlet weak var linkedDeviceCountLabel: UILabel!
    
    @IBOutlet weak var activeChannelLabel: UILabel!
    
    @IBOutlet weak var audioSourceLabel: UILabel!
    
    @IBOutlet weak var macAddressLabel: UILabel!
    
    
    @IBOutlet weak var brightSlider: UISlider!
    @IBOutlet weak var ledInfoLabel: UILabel!
    
    @IBOutlet weak var ledBrightnessLabel: UILabel!
    
    @IBOutlet weak var colorSampleLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        MainTableViewControllerShared = self
        
        
        subscribeForNotification()
        HMNDeviceGeneral.connectToMasterDevice()
    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        tableView.reloadData()
//    }

    func subscribeForNotification() {
        print("subscibeForNotification")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "deviceConnected:", name: EVENT_DEVICE_CONNECTED, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "deviceDisconnected", name: EVENT_DEVICE_DISCONNECTED, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "deviceInfoReceived:", name: EVENT_DEVICE_INFO, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "sensorCaptureColorReceived:", name: EVENT_SENSOR_CAPTURE_COLOR, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "patternReceived:", name: EVENT_PATTERN_INFO, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "versionReceived:", name: EVENT_VERSION, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "brightnessReceived:", name: EVENT_BRIGHTNESS, object: nil)
        
    }

    func deviceConnected(notification: NSNotification) {
        print("deviceConnected")
        
        if let infoDict = notification.userInfo {
            
            let connectionID = (infoDict[KEY_IAP_CONNECTION_ID]?.unsignedLongValue)!;
            let manufacturer = infoDict[KEY_IAP_MANUFACTURER]!;
            let name = infoDict[KEY_IAP_NAME]!;
            let serial = infoDict[KEY_IAP_SERIAL_NUMBER]!;
            
            print("connection params: connectionID = \(connectionID), manufacturer = \(manufacturer), name = \(name), serial = \(serial)")
        }

        let alert = UIAlertController(title: "Connection Status", message: "Device Connected", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
        
        updateDeviceInfoPressed(self)

    }

    func deviceDisconnected() {
        print("deviceDisonnected")
        
        let alert = UIAlertController(title: "Connection Status", message: "Device Disconnected", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)

        clearAllLabels()

    }

    func deviceInfoReceived(notification: NSNotification) {
        print("deviceInfoReceived")
        
        if let devInfoDict = notification.userInfo {
            let devDeviceIndex = (devInfoDict[KEY_DEVICE_INFO_DEVICE_INDEX]?.integerValue)!
            let devName = devInfoDict[KEY_DEVICE_INFO_DEVICE_NAME]!
            let devProductID = (devInfoDict[KEY_DEVICE_INFO_PRODUCT_ID]?.integerValue)!
            let devModelID = (devInfoDict[KEY_DEVICE_INFO_MODEL_ID]?.integerValue)!
            let devBatteryIsCharging = devInfoDict[KEY_DEVICE_INFO_BATTERY_IS_CHARGING]?.boolValue
            let devBatteryValue = (devInfoDict[KEY_DEVICE_INFO_BATTERY_VALUE]?.integerValue)!
            let devLinkedDeviceCount = (devInfoDict[KEY_DEVICE_INFO_LINKED_DEVICE_COUNT]?.integerValue)!
            let devActiveChannelValue = (devInfoDict[KEY_DEVICE_INFO_ACTIVE_CHANNEL_VALUE]?.integerValue)!
            let devAudioSourceValue = (devInfoDict[KEY_DEVICE_INFO_AUDIO_SOURCE_VALUE]?.integerValue)!
            let devMacAddressValue = devInfoDict[KEY_DEVICE_INFO_MAC_ADDRESS_VALUE]!

            deviceNameLabel.text = devName as? String
            productIDLabel.text = "\(devProductID)"
            moduleIDLabel.text = "\(devModelID)"
            batteryChargingStatusLabel.text = devBatteryIsCharging! ? "On" : "Off"
            batteryLevelLabel.text = "\(devBatteryValue)"
            linkedDeviceCountLabel.text = "\(devLinkedDeviceCount)"
            activeChannelLabel.text = "\(devActiveChannelValue)"
            audioSourceLabel.text = "\(devAudioSourceValue)"
            macAddressLabel.text = devMacAddressValue as? String
            
            
            print("devDeviceIndex: \(devDeviceIndex)")
            print("devName: \(devName)")
            print("devProductID: \(devProductID)")
            print("devModelID: \(devModelID)")
            print("devBatteryIsCharging: \(devBatteryIsCharging)")
            print("devBatteryValue: \(devBatteryValue)")
            print("devLinedDeviceCount: \(devLinkedDeviceCount)")
            print("devActiveChannelValue: \(devActiveChannelValue)")
            print("devAudioSourceValue: \(devAudioSourceValue)")
            print("devMacAddressValue: \(devMacAddressValue)")
            

        } else {
            print("Error in deviceInfoReceived")
        }
        
        return;

    }
    
    func sensorCaptureColorReceived(notification: NSNotification) {
        print("sensorCaptureColorReceived")
        
        if let deviceInfoDict = notification.userInfo {
            let R = (deviceInfoDict[KEY_COLOR_R]?.integerValue)!
            let G = (deviceInfoDict[KEY_COLOR_G]?.integerValue)!
            let B = (deviceInfoDict[KEY_COLOR_B]?.integerValue)!
            
            print("RGB Color: \(R), \(G), \(B)")
            colorLabel.text = "R: \(R)\nG: \(G)\nB: \(B)"
            let color = UIColor(red: CGFloat(R)/256, green: CGFloat(G)/256, blue: CGFloat(B)/256, alpha: 1.0)
            colorSampleLabel.backgroundColor = color
            
        } else {
            print("Error in sensorCaptureColorReceived")
        }
    }
    
    func patternReceived(notification: NSNotification) {
        print("patternReceived")
        
        if let deviceInfoDict = notification.userInfo {
            g_ledPatternID =  HMNPattern(rawValue: (deviceInfoDict[KEY_LED_PATTERN_ID]?.integerValue)!)!
            print("Pattern ID: \(g_ledPatternID), name: \(LEDPatternNames[g_ledPatternID.rawValue])")
            ledInfoLabel.text = LEDPatternNames[g_ledPatternID.rawValue]
            
        } else {
            print("Error in patternReceived")
        }

    }
    
    func versionReceived(notification: NSNotification) {
        print("versionReceived")
        
        if let deviceInfoDict = notification.userInfo {
            let swVersion = (deviceInfoDict[KEY_SW_VERSION])!
            let hwVersion = deviceInfoDict[KEY_HW_VERSION]!
            
            versionLabel.text = "SW: \(swVersion), HW: \(hwVersion)"
            print("SW Version: \(swVersion), HW Version: \(hwVersion)")
            
        } else {
            print("Error in patternReceived")
        }
    }
    
    func brightnessReceived(notification: NSNotification) {
        print("brightnessReceived")
        
        if let infoDict = notification.userInfo {
            let brightness = (infoDict[KEY_LED_BRIGHTNESS]?.integerValue)!
            
            ledBrightnessLabel.text = "Set LED Brightness: \(brightness)"
            print("brightness: \(brightness)")
            
        } else {
            print("Error in brightnessReceived")
        }
    }

    @IBAction func updateDeviceInfoPressed(sender: AnyObject) {
        
        HMNDeviceInfo.requestDeviceInfo()
        
        var delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1.2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            HMNDFU.requestVersion()
        }
        
        delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2.2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            HMNLedControl.requestLedPatternInfo()
        }
        
        delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(3.2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            HMNLedControl.requestLedBrightness()
        }
    }
    
    @IBAction func brightChanged(sender: AnyObject) {
        let brightness = UInt8(brightSlider.value)
        print("brightness: \(brightness)")
        ledBrightnessLabel.text = "Set LED Brightness: \(brightness)"
        
        HMNLedControl.setLedBrightness(brightness)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 1 {
            // Device Name
            getTextInput("Device Name", message: "Ener new device name", placeholder: "", defaultValue: deviceNameLabel.text, completion: { (returnValue) -> Void in
                if let newName = returnValue {
                    if newName != "" {
                        HMNDeviceInfo.setDeviceName(newName)
                        self.deviceNameLabel.text = newName
                    }
                }

            })
        }
        else if indexPath.section == 1 && indexPath.row == 2 {
            HMNSensorControl.requestColorFromColorPicker()
        }
        else if indexPath.section == 1 && indexPath.row == 3 {
            HMNLedControl.setBackgroundColor(UIColor.blueColor(), propagateToSlaveDevice: false)
        }
        else if indexPath.section == 1 && indexPath.row == 4 {
            HMNLedControl.setLedChar(65, charColor: UIColor.whiteColor(), backgroundColor: UIColor.blackColor(), applyToSlaveDevice: false)
        }

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    func getTextInput(title: String, message: String, placeholder: String, defaultValue: String?, completion: (returnValue: String?) -> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addTextFieldWithConfigurationHandler({ (textField: UITextField) -> Void in
            textField.placeholder = placeholder
            textField.text = (defaultValue == nil) ? "" : defaultValue
        })
        let action = UIAlertAction(title: "Done", style: .Default, handler: {
            (paramAction: UIAlertAction) -> Void in
            if let textFields = alertController.textFields {
                let theTextFields = textFields as [UITextField]
                let returnValue = theTextFields[0].text
                completion(returnValue: returnValue)
                
            }
        })
        alertController.addAction(action)
        presentViewController(alertController, animated: true, completion: nil)
    }

    @IBAction func changeBackground(sender: AnyObject) {
        HMNLedControl.setBackgroundColor(UIColor.blueColor(), propagateToSlaveDevice: false)

    }
    
    @IBAction func requestColorFromSensor(sender: AnyObject) {
         HMNSensorControl.requestColorFromColorPicker()
    }
    
    @IBAction func setCharA(sender: AnyObject) {
        HMNLedControl.setLedChar(65, charColor: UIColor.whiteColor(), backgroundColor: UIColor.blackColor(), applyToSlaveDevice: false)
    }
    
    func clearAllLabels() {
        versionLabel.text = "N/A"
        deviceNameLabel.text = "N/A"
        productIDLabel.text = "N/A"
        moduleIDLabel.text = "N/A"
        batteryChargingStatusLabel.text = "N/A"
        batteryLevelLabel.text = "N/A"
        linkedDeviceCountLabel.text = "N/A"
        activeChannelLabel.text = "N/A"
        audioSourceLabel.text = "N/A"
        macAddressLabel.text = "N/A"
    }
}
