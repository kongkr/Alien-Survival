//
//  GameScene.swift
//  Jump
//
//  Created by Nico Grenier on 07/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var background:SKNode!
    var midground:SKNode!
    var foreground:SKNode!
    
    var ownUI:SKNode!
    
    var player:SKNode!
    
    var scaleFactor:CGFloat!
    
    var startButton = SKSpriteNode(imageNamed: "TapToStart")
    
    var endOfGame = 0
    
    let motionManager = CMMotionManager()
    
    var xAcceleration:CGFloat = 0.0
    
    var scoreLabel:SKLabelNode!
    var brainsLabel:SKLabelNode!
    var healthLabel:SKLabelNode!
    var badfishLabel:SKLabelNode!
    var goodfishLabel:SKLabelNode!
    var endGameLabel:SKLabelNode!
    
    var playerMaxY:Int!
    
    var gameOver = false
    
    var touchLocation = CGPoint()
    
    var currentMaxY:Int!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size:CGSize) {
        super.init(size: size)
        
        let lvlData = GameHandler.sharedInstance.lvlData
        
        backgroundColor = SKColor.white
        
        currentMaxY = 80
        GameHandler.sharedInstance.score = 0
        GameHandler.sharedInstance.playerHealth = 100
        GameHandler.sharedInstance.brains = 0
        GameHandler.sharedInstance.badFish = 0
        GameHandler.sharedInstance.goodFish = 0
        
        gameOver = false
        
        endOfGame = (lvlData!["EndOfLevel"]! as AnyObject).integerValue

        scaleFactor = self.size.width / 320
        
        background = createBackground()
        addChild(background)
        
        midground = createMidground()
        addChild(midground)
        
        foreground = SKNode()
        addChild(foreground)
        
        ownUI = SKNode()
        addChild(ownUI)
        
        startButton.position = CGPoint(x: self.size.width / 2, y: 180)
        ownUI.addChild(startButton)
        
        
        
        let flower = SKSpriteNode(imageNamed: "normalBrain")
        flower.position = CGPoint(x: 25, y: self.size.height-60)
        ownUI.addChild(flower)
        
        brainsLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        brainsLabel.fontSize = 30
        brainsLabel.fontColor = SKColor.white
        brainsLabel.position = CGPoint(x: 50, y: self.size.height-70)
        brainsLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        
        brainsLabel.text = " \(GameHandler.sharedInstance.brains!)"
        ownUI.addChild(brainsLabel)

        let badfish = SKSpriteNode(imageNamed: "fishGreen_dead")
        badfish.position = CGPoint(x: 25, y: self.size.height-140)
        ownUI.addChild(badfish)
        
        badfishLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        badfishLabel.fontSize = 30
        badfishLabel.fontColor = SKColor.white
        badfishLabel.position = CGPoint(x: 50, y: self.size.height-150)
        badfishLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        
        badfishLabel.text = " \(GameHandler.sharedInstance.badFish!)"
        ownUI.addChild(badfishLabel)

        
        scoreLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        scoreLabel.fontSize = 30
        scoreLabel.fontColor = SKColor.white
        scoreLabel.position = CGPoint(x: self.size.width-20, y: self.size.height-70)
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        
        scoreLabel.text = "0"
        ownUI.addChild(scoreLabel)
        
        let hart = SKSpriteNode(imageNamed: "hudHeart_full")
        hart.position = CGPoint(x: 25, y: self.size.height-100)
        ownUI.addChild(hart)
        
        healthLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        healthLabel.fontSize = 30
        healthLabel.fontColor = SKColor.white
        healthLabel.color = SKColor.lightGray
        healthLabel.position = CGPoint(x: 50, y: self.size.height-110)
        healthLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        
        healthLabel.text = " \(GameHandler.sharedInstance.playerHealth!)"
        ownUI.addChild(healthLabel)
        
        player = createPlayer()
        foreground.addChild(player)
        
        let bricks = lvlData?["Bricks"] as! NSDictionary
        let bricksPatterns = bricks["Patterns"] as! NSDictionary
        let bricksPositions = bricks["Positions"] as! [NSDictionary]
        
        for bricksPosition in bricksPositions {
            
            let x = ( (bricksPosition["x"] as AnyObject) as! NSInteger)
            let y = ( (bricksPosition["y"] as AnyObject) as! NSInteger)
            
            let pattern = bricksPosition["pattern"] as! NSString
            let bricksPattern = bricksPatterns[pattern] as! [NSDictionary]
            
            for bricksPoint in bricksPattern {
                
                let xValue = ( (bricksPoint["x"] as AnyObject) as! NSInteger)
                let yValue = ( (bricksPoint["y"] as AnyObject) as! NSInteger)
                let type = BrickType(rawValue: (bricksPoint["type"]! as AnyObject).intValue)
                let xPosition = CGFloat(xValue + x)
                let yPosition = CGFloat(yValue + y)
                
                let bricksNode = createBrickAtPos(pos: CGPoint(x: xPosition, y: yPosition), ofType: type!)
                foreground.addChild(bricksNode)
            }
        };
        
        let brains = lvlData?["Brains"] as! NSDictionary
        let brainsPatterns = brains["Patterns"] as! NSDictionary
        let brainsPositions = brains["Positions"] as! [NSDictionary]
        
        for brainsPosition in brainsPositions {
            
            let x = ( (brainsPosition["x"] as AnyObject) as! NSInteger)
            let y = ( (brainsPosition["y"] as AnyObject) as! NSInteger)
            
            let pattern = brainsPosition["pattern"] as! NSString
            let brainsPattern = brainsPatterns[pattern] as! [NSDictionary]
            
            for brainsPoint in brainsPattern {
                
                let xValue = ( (brainsPoint["x"] as AnyObject) as! NSInteger)
                let yValue = ( (brainsPoint["y"] as AnyObject) as! NSInteger)
                let type = BrainsType(rawValue: (brainsPoint["type"]! as AnyObject).intValue)
                let xPosition = CGFloat(xValue + x)
                let yPosition = CGFloat(yValue + y)
                
                let brainsNode = createBrainsAtPos(pos: CGPoint(x: xPosition, y: yPosition), ofType: type!)
                foreground.addChild(brainsNode)
            }
        };
        
        let fish = lvlData?["Fish"] as! NSDictionary
        let fishPatterns = fish["Patterns"] as! NSDictionary
        let fishPositions = fish["Positions"] as! [NSDictionary]
        
        for fishPosition in fishPositions {
            
            let x = ( (fishPosition["x"] as AnyObject) as! NSInteger)
            let y = ( (fishPosition["y"] as AnyObject) as! NSInteger)
            
            let pattern = fishPosition["pattern"] as! NSString
            let fishPattern = fishPatterns[pattern] as! [NSDictionary]
            
            for fishPoint in fishPattern {
                
                let xValue = ( (fishPoint["x"] as AnyObject) as! NSInteger)
                let yValue = ( (fishPoint["y"] as AnyObject) as! NSInteger)
                let type = FishType(rawValue: (fishPoint["type"]! as AnyObject).intValue)
                let xPosition = CGFloat(xValue + x)
                let yPosition = CGFloat(yValue + y)
                
                let fishNode = createFishAtPos(pos: CGPoint(x: xPosition, y: yPosition), ofType: type!)
                foreground.addChild(fishNode)
            }
        };
        
        let heart = lvlData?["Heart"] as! NSDictionary
        let heartPositions = heart["Positions"] as! [NSDictionary]
        
        for heartPosition in heartPositions {
            
            let x = ( (heartPosition["x"] as AnyObject) as! NSInteger)
            let y = ( (heartPosition["y"] as AnyObject) as! NSInteger)
                
            let heartNode = createHeartAtPos(pos: CGPoint(x: x, y: y))
            foreground.addChild(heartNode)
        };
        
        let bomb = lvlData?["Bomb"] as! NSDictionary
        let bombPositions = bomb["Positions"] as! [NSDictionary]
        
        for bombPosition in bombPositions {
            
            let x = ( (bombPosition["x"] as AnyObject) as! NSInteger)
            let y = ( (bombPosition["y"] as AnyObject) as! NSInteger)
            
            let bombNode = createBombAtPos(pos: CGPoint(x: x, y: y))
            foreground.addChild(bombNode)
        };
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -2)//na benede valle
        physicsWorld.contactDelegate = self
        
        if GameHandler.sharedInstance.motionOn == true {
            motionManager.accelerometerUpdateInterval = 0.2
        
            motionManager.startAccelerometerUpdates()
        
            if let accelerometerData = motionManager.accelerometerData {
                let acceleration = accelerometerData.acceleration
                self.xAcceleration = (CGFloat(acceleration.x) * 0.75 + (self.xAcceleration * 0.25)) //using motion
            }
        }
    }
    
    
    override func didSimulatePhysics() {
        player.physicsBody?.velocity = CGVector(dx: xAcceleration * 10, dy: player.physicsBody!.velocity.dy)
        if GameHandler.sharedInstance.boundariesOn == false {
            if player.position.x < -10 {
                player.position = CGPoint(x: self.size.width + 10, y: player.position.y)
            } else if (player.position.x > self.size.width + 10) {
                player.position = CGPoint(x: -10, y: player.position.y)
            }
        } else {
            if player.position.x < -10 {
                player.position = CGPoint(x: -10, y: player.position.y)
            } else if (player.position.x > self.size.width + 10) {
                player.position = CGPoint(x: self.size.width + 10, y: player.position.y)
            }
        }
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        var updateUI = false;
        var otherNode:SKNode!
        
        if contact.bodyA.node != player {
            otherNode = contact.bodyA.node
        } else {
            otherNode = contact.bodyB.node
        }
        
        updateUI = (otherNode as! GenericNode).collisionWithPlayer(player: player)
        if updateUI {
            brainsLabel.text = "   \(GameHandler.sharedInstance.brains!)"
            scoreLabel.text = "   \(GameHandler.sharedInstance.score!)"
            healthLabel.text = "   \(GameHandler.sharedInstance.playerHealth!)"
            badfishLabel.text = "   \(GameHandler.sharedInstance.badFish!)"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if GameHandler.sharedInstance.motionOn == true { //this is only working with motion
            if player.physicsBody!.isDynamic {
                return
            }
        }
        
        startButton.removeFromParent()
        
        player.physicsBody?.isDynamic = true
        for touch in touches {
            touchLocation = touch.location(in: self)
        }

        var leftOrRight = 0
        let center = player.position.x
        
        if touchLocation.x < center {
            leftOrRight = -((Int(center) - Int(touchLocation.x)))
        } else {
                leftOrRight = ((Int(touchLocation.x) - Int(center)))
        }
        
        player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 20))//jump
        
        let movement = SKAction.move(by: CGVector(dx: leftOrRight, dy: 0), duration: 0.5)
        player.run(movement)
        
        GameHandler.sharedInstance.playerHealth! -= 4
        healthLabel.text = "   \(GameHandler.sharedInstance.playerHealth!)"

    }

    override func update(_ currentTime: CFTimeInterval) {
        if gameOver {
            return
        }
        
        //remove objects that are no longer on screen
        foreground.enumerateChildNodes(withName: "BRAINSNODE") {
        (node, stop) in
         let brains = node as! BrainsNode
         brains.shouldRemoveNode(playerY: self.player.position.y)
        }
         
        foreground.enumerateChildNodes(withName: "BRICKNODE", using: {
         (node, stop) in
         let brick = node as! BrickNode
         brick.shouldRemoveNode(playerY: self.player.position.y)
         
        })
        
        foreground.enumerateChildNodes(withName: "FISHNODE", using: {
            (node, stop) in
            let fish = node as! FishNode
            fish.shouldRemoveNode(playerY: self.player.position.y)
            
        })
        
        foreground.enumerateChildNodes(withName: "HEARTNODE", using: {
            (node, stop) in
            let heart = node as! HeartNode
            heart.shouldRemoveNode(playerY: self.player.position.y)
            
        })
        
        foreground.enumerateChildNodes(withName: "BOMBNODE", using: {
            (node, stop) in
            let bomb = node as! BombNode
            bomb.shouldRemoveNode(playerY: self.player.position.y)
            
        })
        
        if player.position.y > 200 {//online, background move
            background.position = CGPoint(x: 0, y: -((player.position.y - 200)/10))
            midground.position = CGPoint(x: 0, y: -((player.position.y - 200)/4))
            foreground.position = CGPoint(x: 0,y: -(player.position.y - 200))
        }
        
        if Int(player.position.y) > currentMaxY {
            (GameHandler.sharedInstance.score)! += Int(player.position.y) - currentMaxY
            currentMaxY = Int(player.position.y)
            scoreLabel.text = " \(GameHandler.sharedInstance.score!)"
        }
        
        if Int(player.position.y) > endOfGame {
            GameHandler.sharedInstance.score! += 2000//game finished extra points
            GameHandler.sharedInstance.endGameState = "You've SURVIVED!"
            endGame()

        }
        
        if Int(player.position.y) < currentMaxY - 800 {
            GameHandler.sharedInstance.score! -= 2500//game over score
            GameHandler.sharedInstance.endGameState = "Game Over..."
            endGame()
        }
        
        if GameHandler.sharedInstance.playerHealth < 1 {
            GameHandler.sharedInstance.score! -= 3000//dead, less score
            GameHandler.sharedInstance.endGameState = "Game Over"
            endGame()
        }
    }
    
    func saveGame() {
        GameHandler.sharedInstance.saveGame()
    }
    
    func endGame() {
        gameOver = true
        GameHandler.sharedInstance.saveGame()
        
        let transition = SKTransition.fade(withDuration: 1.0)
        let endGameScene = EndGame(size: self.size)
        self.view?.presentScene(endGameScene, transition: transition)
    }
    

}
