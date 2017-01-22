//
//  SettingViewController.swift
//  Jump
//
//  Created by Nico Grenier on 08/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet var switch1: UISwitch!
    @IBOutlet var switch2: UISwitch!
    
    @IBOutlet var label2: UILabel!
    @IBOutlet var label: UILabel!
    @IBOutlet var playerButtonIMG3: UIButton!
    @IBOutlet var playerButtonIMG2: UIButton!
    @IBOutlet var playerButtonIMG: UIButton!

    @IBOutlet var alienChoosingLabel: UILabel!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "colored_grass"))
        
        let playerIMG = UIImage(named: "player")
        let playerIMG2 = UIImage(named: "player2")
        let playerIMG3 = UIImage(named: "player3")
        
        playerButtonIMG.setImage(playerIMG, for: UIControlState.normal)
        playerButtonIMG.tintColor = UIColor.yellow
    
        playerButtonIMG2.setImage(playerIMG2, for: UIControlState.normal)
        playerButtonIMG2.tintColor = UIColor.blue
        
        playerButtonIMG3.setImage(playerIMG3, for: UIControlState.normal)
        playerButtonIMG3.tintColor = UIColor.green
        
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 25)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Motion?"
        
        
        label2.font = UIFont(name: "AmericanTypewriter-Bold", size: 25)
        label2.textColor = .black
        label2.textAlignment = .left
        label2.text = "Boundaries?"
        
        alienChoosingLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 30)
        
        if GameHandler.sharedInstance.motionOn == false {
            switch1.setOn(false, animated: false)
        } else {
            switch1.setOn(true, animated: false)
        }
        
        if GameHandler.sharedInstance.boundariesOn == false {
            switch2.setOn(false, animated: false)
        } else {
            switch2.setOn(true, animated: false)
        }
        
        self.view.addSubview(label)
        self.view.addSubview(label2)
    }
    
    @IBAction func changePlayerImg(_ sender: Any) {
        GameHandler.sharedInstance.changePlayerImg(img: "player")
    }
    
    @IBAction func changePlayerImg2(_ sender: Any) {
        GameHandler.sharedInstance.changePlayerImg(img: "player2")
    }

    @IBAction func changePlayerImg3(_ sender: Any) {
        GameHandler.sharedInstance.changePlayerImg(img: "player3")
        
    }
    
    @IBAction func motionSwitchOn(_ sender: Any) {
        GameHandler.sharedInstance.setMotionOn()
    }
    
    @IBAction func boundariesSwitchOn(_ sender: Any) {
        GameHandler.sharedInstance.setBoundariesOn()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
