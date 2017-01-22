//
//  GameElements.swift
//  Jump
//
//  Created by Nico Grenier on 07/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import SpriteKit

extension GameScene {
    
    func createBackground () -> SKNode {//found online
        let backgroundNode = SKNode()
        let spacing = 64 * scaleFactor
        
        for index in 0 ... 19 {
            let node = SKSpriteNode(imageNamed: String(format:"Background%02d", index + 1))
            node.setScale(scaleFactor)
            node.anchorPoint = CGPoint(x: 0.5, y: 0)
            node.position = CGPoint(x: self.size.width / 2, y: spacing * CGFloat(index))
            
            backgroundNode.addChild(node)
        }
        
        return backgroundNode
    }
    
    func createMidground () -> SKNode {//found online
        let midgroundNode = SKNode()
        var anchor:CGPoint!
        var xPos:CGFloat!
        
        for index in 0 ... 9 {
            var name:String
            
            let randomNumber = arc4random() % 2
            
            if randomNumber > 0 {
                name = "cloudLeft"
                anchor = CGPoint(x: 0, y: 0.5)
                xPos = 0
            } else {
                name = "cloudRight"
                anchor = CGPoint(x: 1, y: 0.5)
                xPos = self.size.width
            }
            
            let cloudNode = SKSpriteNode(imageNamed: name)
            cloudNode.anchorPoint = anchor
            cloudNode.position = CGPoint(x: xPos, y:500*CGFloat(index))
            
            midgroundNode.addChild(cloudNode)
        }
        
        return midgroundNode
    
    }
    
    func createPlayer() -> SKNode {
        let playerNode = SKNode()
        playerNode.position = CGPoint(x: self.size.width / 2, y: 80)
        
        let playerIMG = GameHandler.sharedInstance.playerIMG
        
        let sprite = SKSpriteNode(imageNamed: playerIMG!)//changeable playersprite
        playerNode.addChild(sprite)
        
        playerNode.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width / 2)
        
        playerNode.physicsBody?.isDynamic = false
        playerNode.physicsBody?.allowsRotation = false
        
        playerNode.physicsBody?.restitution = 1
        playerNode.physicsBody?.friction = 0
        playerNode.physicsBody?.angularDamping = 0
        playerNode.physicsBody?.linearDamping = 0
        
        playerNode.physicsBody?.usesPreciseCollisionDetection = true
        
        playerNode.physicsBody?.categoryBitMask = CollisionBitMask.Player
        
        playerNode.physicsBody?.collisionBitMask = 0
        playerNode.physicsBody?.contactTestBitMask = CollisionBitMask.Flower | CollisionBitMask.Brick | CollisionBitMask.Fish | CollisionBitMask.Heart | CollisionBitMask.Bomb
        
        return playerNode
    }
    
    func createBrickAtPos(pos:CGPoint, ofType type:BrickType)  -> BrickNode {
        let node = BrickNode()
        let position = CGPoint(x: pos.x * scaleFactor, y: pos.y)
        node.position = position
        node.name = "BRICKNODE"
        node.brickType = type
        
        var sprite:SKSpriteNode
        
        if type == BrickType.normalBrick {
            sprite = SKSpriteNode(imageNamed: "brick")
        } else {
            sprite = SKSpriteNode(imageNamed: "brickBreak")
        }
        
        node.addChild(sprite)
        
        node.physicsBody = SKPhysicsBody(rectangleOf: sprite.size)
        node.physicsBody?.isDynamic = false
        node.physicsBody?.categoryBitMask = CollisionBitMask.Brick
        node.physicsBody?.collisionBitMask = 1//so he won't float true
        
        return node
    }
    
    func createBrainsAtPos(pos:CGPoint, ofType type:BrainsType)  -> BrainsNode {
        let node = BrainsNode()
        let position = CGPoint(x: pos.x * scaleFactor, y: pos.y)
        node.position = position
        node.name = "BRAINSNODE"
        node.brainsType = type
        
        var sprite:SKSpriteNode
        
        if type == BrainsType.NormalBrains {
            sprite = SKSpriteNode(imageNamed: "normalBrain")
        } else {
            sprite = SKSpriteNode(imageNamed: "specialBrain")
        }
        
        node.addChild(sprite)
        
        node.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width / 2)
        node.physicsBody?.isDynamic = false
        node.physicsBody?.categoryBitMask = CollisionBitMask.Flower
        node.physicsBody?.collisionBitMask = 0
        
        return node
    }
    
    func createFishAtPos(pos:CGPoint, ofType type:FishType)  -> FishNode {
        let node = FishNode()
        let position = CGPoint(x: pos.x * scaleFactor, y: pos.y)
        node.position = position
        node.name = "FISHNODE"
        node.fishType = type
        
        var sprite:SKSpriteNode
        
        if type == FishType.BadFish {
            sprite = SKSpriteNode(imageNamed: "fishGreen_dead")
        } else {
            sprite = SKSpriteNode(imageNamed: "fishPink_move")
        }
        
        node.addChild(sprite)
        
        node.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width / 2)
        node.physicsBody?.isDynamic = false
        node.physicsBody?.categoryBitMask = CollisionBitMask.Fish
        node.physicsBody?.collisionBitMask = 0
        
        return node
    }
    
    func createHeartAtPos(pos:CGPoint)  -> HeartNode {
        let node = HeartNode()
        let position = CGPoint(x: pos.x * scaleFactor, y: pos.y)
        node.position = position
        node.name = "HEARTNODE"
        
        var sprite:SKSpriteNode
        
        sprite = SKSpriteNode(imageNamed: "hudHeart_full")
        
        node.addChild(sprite)
        
        node.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width / 2)
        node.physicsBody?.isDynamic = false
        node.physicsBody?.categoryBitMask = CollisionBitMask.Heart
        node.physicsBody?.collisionBitMask = 0
        
        return node
    }
    
    func createBombAtPos(pos:CGPoint)  -> BombNode {
        let node = BombNode()
        let position = CGPoint(x: pos.x * scaleFactor, y: pos.y)
        node.position = position
        node.name = "BOMBNODE"
        
        var sprite:SKSpriteNode
        
        sprite = SKSpriteNode(imageNamed: "bomb")
        
        node.addChild(sprite)
        
        node.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width / 2)
        node.physicsBody?.isDynamic = false
        node.physicsBody?.categoryBitMask = CollisionBitMask.Bomb
        node.physicsBody?.collisionBitMask = 0
        
        return node
    }
}
