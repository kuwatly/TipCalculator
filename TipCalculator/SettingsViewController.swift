//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Iyad Kuwatly on 3/4/17.
//  Copyright © 2017 Iyad Kuwatly. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let intTipPercentageIndex = defaults.integer(forKey: "tip_percentage_index_key")
        if (intTipPercentageIndex>=0 && intTipPercentageIndex<3) {
            tipControl.selectedSegmentIndex=intTipPercentageIndex
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipPercentageUpdate(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tip_percentage_index_key")
        defaults.synchronize()
    }

}
