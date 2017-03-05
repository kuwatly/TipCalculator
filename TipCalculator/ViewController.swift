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
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var tipTitleLabel: UILabel!
    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.resultsView.alpha = 0

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUITheme()
        
        let defaults = UserDefaults.standard
        let lastUsageDate = defaults.object(forKey: "lastUsageDate") as! NSDate?
        
        if lastUsageDate !== nil && (lastUsageDate?.timeIntervalSinceNow)! > (-1 * 60 * 8) {
            // Update Vill Value
            billField.text = defaults.string(forKey: "lastUsageBillValue")
            
            // Update theme
            let intThemeIndex = defaults.integer(forKey: "theme_index_key")
            if (intThemeIndex==0) { Style.themeLight() }
            else { Style.themeDark() }
            
            // Update tip percentage
            let intTipPercentageIndex = defaults.integer(forKey: "tip_percentage_index_key")
            if (intTipPercentageIndex>=0 && intTipPercentageIndex<3) {
                tipControl.selectedSegmentIndex=intTipPercentageIndex
            }
        }
        
        updateUITheme()
        calculateTip(self)
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
    
    func updateUITheme () {
        // Update background colors
        mainView.backgroundColor=Style.styleBackgroundColor
        resultsView.backgroundColor=Style.styleBackgroundColor
        separatorView.backgroundColor=Style.styleSeparatorColor
        
        // Update font colors
        totalLabel.textColor = Style.styleFontColor
        tipLabel.textColor = Style.styleFontColor
        billField.textColor = Style.styleFontColor
        tipTitleLabel.textColor = Style.styleFontColor
        totalTitleLabel.textColor = Style.styleFontColor

    }
}

