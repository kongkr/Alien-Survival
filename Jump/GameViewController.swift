//
//  GameViewController.swift
//  Jump
//
//  Created by Nico Grenier on 07/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var skView:SKView!
    var scene:GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*navigationController?.isNavigationBarHidden = true
        navigationController?.isToolbarHidden = true*/
        
        skView = self.view as! SKView
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFit
        
        skView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func didMove(toParentViewController parent: UIViewController?) { //isn't working :(
        if self.isMovingToParentViewController == true {
            scene.saveGame()
            self.willMove(toParentViewController: parent)
            
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
