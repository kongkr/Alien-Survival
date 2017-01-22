//
//  FlowerNode.swift
//  Jump
//
//  Created by Nico Grenier on 07/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import SpriteKit

class HeartNode: GenericNode {

    override func collisionWithPlayer(player: SKNode) -> Bool {
        
        var xHealth:Int?
        var xScore:Int?
        
        player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 400)
        xHealth = 75
        xScore = 2500
            
        (GameHandler.sharedInstance.playerHealth)! += (xHealth)!
        (GameHandler.sharedInstance.score)! += (xScore)!

        
        self.removeFromParent()
        
        return true
    }
    
}
