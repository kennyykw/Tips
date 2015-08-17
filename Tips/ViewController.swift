//
//  ViewController.swift
//  Tips
//
//  Created by Kenny on 8/12/15.
//  Copyright (c) 2015 Kenny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var tipLabel: UILabel!

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billTextField: UITextField! {
        didSet {
            billTextField.delegate = self
        }
    }
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipStaticText: UILabel!
    
    @IBOutlet weak var totalStaticLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        tipControl.alpha = 0
        tipLabel.alpha = 0
        tipStaticText.alpha = 0
        totalStaticLabel.alpha = 0
        totalLabel.alpha = 0
        
        billTextField.attributedPlaceholder = NSAttributedString (string:"$Bill Amount", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
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
        
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {

        self.tipControl.center = CGPoint (x: 0, y: 1000)
        self.tipLabel.center = CGPoint (x: 260, y: 1257)
        self.tipStaticText.center = CGPoint (x: 0, y: 1000)
        self.totalStaticLabel.center = CGPoint(x: 0, y: 1000)
        self.totalLabel.center = CGPoint(x: 260, y: 1317)
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.tipControl.alpha = 1
            self.tipControl.center = CGPoint(x: 0, y: 0)
        
            self.tipLabel.alpha = 1
            self.tipLabel.center = CGPoint (x: 260, y: 257)
            
            self.tipStaticText.alpha = 1
            self.tipStaticText.center = CGPoint(x: 0, y: 0)
            
            self.totalStaticLabel.alpha = 1
            self.totalStaticLabel.center = CGPoint(x: 0, y: 0)
            
            self.totalLabel.alpha = 1
            self.totalLabel.center = CGPoint(x: 260, y: 317)
                    
            
        })
        return true
    }
    
    
}

