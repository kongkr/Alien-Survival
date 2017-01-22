//
//  FlowerNode.swift
//  Jump
//
//  Created by Nico Grenier on 07/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import SpriteKit

class BombNode: GenericNode {
    
    override func collisionWithPlayer(player: SKNode) -> Bool {
        
        var xHealth:Int?
        var xScore:Int?
        
        player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 700)
        xHealth = 75
        xScore = 5000
        
        (GameHandler.sharedInstance.playerHealth)! -= (xHealth)!
        (GameHandler.sharedInstance.score)! += (xScore)!
        
        
        self.removeFromParent()
        
        return true
    }
    
}
