//
//  ViewController.swift
//  Tips
//
//  Created by Kenny on 8/12/15.
//  Copyright (c) 2015 Kenny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func inEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.25]
        var tipPercentage = tipPercentages [tipControl.selectedSegmentIndex]
        
        
        var billAmount = NSString(string: billTextField.text).doubleValue
        var tips = billAmount * tipPercentage
        var total = billAmount + tips
        
        tipLabel.text = "$\(tips)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tips)
        totalLabel.text = String(format: "$%.2f", total)
        
        tipControl.alpha = 0
        
        UISegmentedControl.animateWithDuration(0.4, animations: {
            self.tipControl.alpha = 1
        })
        
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
}

