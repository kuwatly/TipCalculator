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
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var themeControl: UISegmentedControl!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard

        let lastUsageDate = defaults.object(forKey: "lastUsageDate") as! NSDate?
            if lastUsageDate !== nil && (lastUsageDate?.timeIntervalSinceNow)! > (-1 * 60 * 8) {
            let intTipPercentageIndex = defaults.integer(forKey: "tip_percentage_index_key")
            if (intTipPercentageIndex>=0 && intTipPercentageIndex<3) {
                tipControl.selectedSegmentIndex=intTipPercentageIndex
            }
            let intThemeIndex = defaults.integer(forKey: "theme_index_key")
            if (intThemeIndex>=0 && intThemeIndex<2) {
                themeControl.selectedSegmentIndex=intThemeIndex
            }
        }
        updateUITheme()
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
    @IBAction func themeUpdate(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(themeControl.selectedSegmentIndex, forKey: "theme_index_key")
        defaults.synchronize()
        if (themeControl.selectedSegmentIndex==0) { Style.themeLight() }
        else { Style.themeDark() }
        updateUITheme()
        
    }
    
    func updateUITheme () {
        // Update background colors
        mainView.backgroundColor=Style.styleBackgroundColor
        
        // Update font colors
        themeLabel.textColor = Style.styleFontColor
        tipLabel.textColor = Style.styleFontColor
        
    }

}
