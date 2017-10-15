//
//  SettingsViewController.swift
//  ALensStory
//
//  Created by Joe's Computer on 9/30/17.
//  Copyright © 2017 Joseph Mennemeier. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // create an if statement for the switch that toggles the on/off boolean statement for userdeafults and creates a nil encounter for all the sound functions
    
   
    @IBOutlet var darkModeSwitch: UISwitch!
    @IBOutlet var storyModeOnlySwitch: UISwitch!
    
    @objc func switches() {
        if darkModeSwitch.isOn {
            userDefault.set(true, forKey: "darkMode")
            userDefaultDarkMode = true
        } else {
            userDefault.set(false, forKey: "darkMode")
            userDefaultDarkMode = false
        }
        if storyModeOnlySwitch.isOn {
            userDefault.set(true, forKey: "storyModeOnly")
            userDefaultStoryMode = true
        } else {
            userDefault.set(false, forKey: "storyModeOnly")
            userDefaultStoryMode = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        switches()
        darkModeSwitch.addTarget(self, action: #selector(switches), for: .touchUpInside)
        storyModeOnlySwitch.addTarget(self, action: #selector(switches), for: .touchUpInside)
        if userDefaultDarkMode == true {
            darkModeSwitch.setOn(true, animated: false)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
