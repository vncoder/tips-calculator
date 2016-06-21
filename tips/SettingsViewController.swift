//
//  SettingsViewController.swift
//  tips
//
//  Created by Le Minh Chau on 6/21/16.
//  Copyright (c) 2016 Le Minh Chau. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTips: UISegmentedControl!
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("settings view did disappear")
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTips.selectedSegmentIndex, forKey: "tipKey")
        defaults.synchronize()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("settings view did appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipKey")
        defaultTips.selectedSegmentIndex=intValue
    }
 
}
