//
//  ViewController.swift
//  ClownFiesta
//
//  Created by iosdev on 5.4.2016.
//  Copyright © 2016 Oliver. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate{
    
    // MARK: Properties
    
    var myCentralManager: CBCentralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
         myCentralManager.scanForPeripheralsWithServices(nil, options: nil)
    }
    
    // Start up the CBCentralManager
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        myCentralManager = CBCentralManager(delegate: self, queue:dispatch_get_main_queue())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager) {
        //
    }
    
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        // When beacons are found
        print(peripheral)
        print(RSSI)        
        
    }
    
}
