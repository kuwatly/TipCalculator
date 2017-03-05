//
//  ViewController.swift
//  TipCalculator
//
//  Created by Iyad Kuwatly on 3/3/17.
//  Copyright © 2017 Iyad Kuwatly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var resultsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.resultsView.alpha = 0

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        let intTipPercentageIndex = defaults.integer(forKey: "tip_percentage_index_key")
        if (intTipPercentageIndex>=0 && intTipPercentageIndex<3) {
            tipControl.selectedSegmentIndex=intTipPercentageIndex
            calculateTip(self)
        }

        let lastUsageDate = defaults.object(forKey: "lastUsageDate") as! NSDate?
        
        if lastUsageDate !== nil && (lastUsageDate?.timeIntervalSinceNow)! > (-1 * 60 * 8) {
            billField.text = defaults.string(forKey: "lastUsageBillValue")
        }
        
        billField.becomeFirstResponder()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        if (billField.hasText) {
            UIView.animate(withDuration: 0.4, animations: {
                self.resultsView.alpha = 1
            })
            let tipPercentages = [0.18, 0.2, 0.25]
        
            let bill = Double(billField.text!) ?? 0
            let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
            let total = bill + tip
        
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            
            let defaults = UserDefaults.standard
            defaults.set(NSDate(), forKey: "lastUsageDate")
            defaults.set(billField.text, forKey: "lastUsageBillValue")

        } else {
            UIView.animate(withDuration: 0.4, animations: {
                self.resultsView.alpha = 0
            })
            
        }
    }
}

