//
//  BrickNode.swift
//  Jump
//
//  Created by Nico Grenier on 07/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import SpriteKit

class BrickNode: GenericNode {

    var brickType:BrickType!
    
    override func collisionWithPlayer(player: SKNode) -> Bool {
            player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 250) //land op brick
            
            if brickType == BrickType.breakableBrick {
                self.removeFromParent()
                GameHandler.sharedInstance.playerHealth! -= 6
                GameHandler.sharedInstance.score! += 55
            }
            
        
    return true
    }
    
}
