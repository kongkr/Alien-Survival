//
//  GenericNode.swift
//  Jump
//
//  Created by Nico Grenier on 07/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import SpriteKit

struct CollisionBitMask {
    static let Player:UInt32 = 0x00
    static let Flower:UInt32 = 0x01
    static let Brick:UInt32 = 0x02
    static let Fish:UInt32 = 0x03
    static let Heart:UInt32 = 0x04
    static let Bomb:UInt32 = 0x05
}

enum BrickType:Int {
    case normalBrick = 0
    case breakableBrick = 1
}

class GenericNode: SKNode {
    
    func collisionWithPlayer (player:SKNode) -> Bool {
        return false
    }
    
    func shouldRemoveNode (playerY:CGFloat) {
        if playerY > self.position.y + 300 {
            self.removeFromParent()
        }
    }
}
