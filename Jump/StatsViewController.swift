//
//  StatsViewController.swift
//  Jump
//
//  Created by Nico Grenier on 08/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    //labels zelf maken in code
    /*let label = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 40))
    let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 40))
    let label3 = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 40))
    let label4 = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 40))
    let label5 = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 40))
    let label6 = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 40))
    let label7 = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 40))*/
    
    
    @IBOutlet var label: UILabel!
    @IBOutlet var label6: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label7: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label5: UILabel!
    
    //labels gemaakt in storyboard
    @IBOutlet var myStatsLabel: UILabel!
    @IBOutlet var overalStatsLabel: UILabel!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "colored_grass"))
        
        myStatsLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 40)
        overalStatsLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 40)
        
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 25)
        label.textColor = .black
        //label.center = CGPoint(x: 190, y: 150)
        label.textAlignment = .left
        label.text = "Score:   \(GameHandler.sharedInstance.score!)"
        
        label6.font = UIFont(name: "AmericanTypewriter-Bold", size: 25)
        label6.textColor = .black
        //label6.center = CGPoint(x: 190, y: 200)
        label6.textAlignment = .left
        label6.text = "Brains:   \(GameHandler.sharedInstance.brains!)"
        
        
        label7.font = UIFont(name: "AmericanTypewriter-Bold", size: 25)
        label7.textColor = .black
        //label7.center = CGPoint(x: 190, y: 250)
        label7.textAlignment = .left
        label7.text = "Fishes:   \(GameHandler.sharedInstance.badFish! + GameHandler.sharedInstance.goodFish!)"
        
        label2.font = UIFont(name: "AmericanTypewriter-Bold", size: 25)
        label2.textColor = .black
        //label2.center = CGPoint(x: 190, y: 400)
        label2.textAlignment = .left
        label2.text = "Brains:   \(GameHandler.sharedInstance.brainsEatenTotal())"
        

        label3.font = UIFont(name: "AmericanTypewriter-Bold", size: 25)
        label3.textColor = .black
        //label3.center = CGPoint(x: 190, y: 450)
        label3.textAlignment = .left
        label3.text = "Highscore:   \(GameHandler.sharedInstance.highScore!)"
        
        label4.font = UIFont(name: "AmericanTypewriter-Bold", size: 25)
        label4.textColor = .black
        //label4.center = CGPoint(x: 190, y: 500)
        label4.textAlignment = .left
        label4.text = "Healthy fish:   \(GameHandler.sharedInstance.goodFishEatenTotal())"
        
        label5.font = UIFont(name: "AmericanTypewriter-Bold", size: 25)
        label5.textColor = .black
        //label5.center = CGPoint(x: 190, y: 550)
        label5.textAlignment = .left
        label5.text = "Unhealthy fish:   \(GameHandler.sharedInstance.badFishEatenTotal())"
        
        
        
        /*self.view.addSubview(label)
        self.view.addSubview(label2)
        self.view.addSubview(label3)
        self.view.addSubview(label4)
        self.view.addSubview(label5)
        self.view.addSubview(label6)
        self.view.addSubview(label7)*/
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")//go to portrait

        
    }
    
    func refreshPage() {
        label2.text = "Brains:   \(GameHandler.sharedInstance.brains!)"
        label3.text = "Highscore:   \(GameHandler.sharedInstance.highScore!)"
        label.text = "Score:   \(GameHandler.sharedInstance.score!)"
        label4.text = "Fish eaten:   \(GameHandler.sharedInstance.goodFishEatenTotal())"
        label5.text = "Bad fish eaten:   \(GameHandler.sharedInstance.badFish!)"
        label6.text = "Brains:   \(GameHandler.sharedInstance.brains!)"
        label7.text = "Fishes:   \(GameHandler.sharedInstance.goodFish! + GameHandler.sharedInstance.badFish!)"

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    @IBAction func resetStats() {
        GameHandler.sharedInstance.clearStats()
        refreshPage()
    }
    
}
