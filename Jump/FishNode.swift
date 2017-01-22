//
//  FlowerNode.swift
//  Jump
//
//  Created by Nico Grenier on 07/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import SpriteKit

enum FishType:Int {
    case BadFish = 0
    case GoodFish = 1
}

class FishNode: GenericNode {
    var fishType : FishType!
    
    override func collisionWithPlayer(player: SKNode) -> Bool {

        var xBadFish:Int?
        var xGoodFish:Int?
        var xHealth:Int?
        var xScore:Int?
        
        if fishType == FishType.BadFish {
            player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 175)
            xBadFish = 1
            xHealth = 11
            xScore = 75
            
            (GameHandler.sharedInstance.playerHealth)! -= (xHealth)!
            (GameHandler.sharedInstance.badFish)! += (xBadFish)!
            (GameHandler.sharedInstance.score)! -= (xScore)!
        } else {
            
            player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 300)
            xGoodFish = 1
            xHealth = 8
            xScore = 150
            
            (GameHandler.sharedInstance.playerHealth)! += (xHealth)!
            (GameHandler.sharedInstance.goodFish)! += (xGoodFish)!
            (GameHandler.sharedInstance.score)! += (xScore)!
        }

        
        self.removeFromParent()
        
        return true
    }
    
}
