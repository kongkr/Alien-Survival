//
//  FlowerNode.swift
//  Jump
//
//  Created by Nico Grenier on 07/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import SpriteKit

enum BrainsType:Int {
    case NormalBrains = 0
    case SpecialBrains = 1
}

class BrainsNode: GenericNode {
    var brainsType : BrainsType!
    
    override func collisionWithPlayer(player: SKNode) -> Bool {
        player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 300)//boostje als hij ne brain raakt
        var xBrains:Int?
        var xScore:Int?
        var xHealth:Int?
        
        if brainsType == BrainsType.NormalBrains {
            xBrains = 1
            xScore = 20
            xHealth = 11
            (GameHandler.sharedInstance.playerHealth)! += (xHealth)!//health
        } else {
            xBrains = 5
            xScore = 100
            xHealth = 3
            (GameHandler.sharedInstance.playerHealth)! -= (xHealth)!//health
        }
    
        (GameHandler.sharedInstance.score)! += (xScore)! //points
        (GameHandler.sharedInstance.brains)! += (xBrains)! //bloeme geve
        
        self.removeFromParent()
        
        return true
    }

}
