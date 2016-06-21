//
//  ViewController.swift
//  tips
//
//  Created by Le Minh Chau on 6/20/16.
//  Copyright (c) 2016 Le Minh Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtAmount: UITextField!
    
    @IBOutlet weak var lblTip: UILabel!
    
    @IBOutlet weak var lblTotal: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblTip.text="$0.00"
        lblTotal.text="$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditChanged(sender: AnyObject) {
        cal()
    }
    
    func cal(){
        var tipPercents=[0.15,0.2,0.25]
        var tipPercentage=tipPercents[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string:txtAmount.text!).doubleValue;
        var tipsAmt=billAmount * tipPercentage;
        var total=tipsAmt + billAmount;
        lblTip.text=String(format:"%.2f",tipsAmt)
        lblTotal.text=String(format:"%.2f",total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        txtAmount.becomeFirstResponder()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipKey")
        tipControl.selectedSegmentIndex=intValue
        cal()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }
}

