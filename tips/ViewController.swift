//
//  ViewController.swift
//  tips
//
//  Created by Audrey Cole on 12/29/15.
//  Copyright © 2015 Audrey Cole. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Configure labels
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        //var billAmount = Double(billField.text!)
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        // Assign label values
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        // Want 2 significant figures for $ amount
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f",total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        // Turn off the keyboard if you tap anywhere on the screen
        view.endEditing(true)
    }
    
}

