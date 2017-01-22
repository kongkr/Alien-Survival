//
//  HelpViewController.swift
//  Jump
//
//  Created by Nico Grenier on 08/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    
    @IBOutlet var objectLabel: UILabel!
    @IBOutlet var survivalLabel: UILabel!
    @IBOutlet var howLabel2: UILabel!
    @IBOutlet var uitlegGame: UITextView!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "colored_grass"))
        
        objectLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 30)
        objectLabel.textColor = .black

        survivalLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 30)
        survivalLabel.textColor = .black

        howLabel2.font = UIFont(name: "AmericanTypewriter-Bold", size: 30)
        howLabel2.textColor = .black
        
        uitlegGame.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
