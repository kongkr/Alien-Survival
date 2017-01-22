
import SpriteKit

class EndGame: SKScene {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        
        let brains = SKSpriteNode(imageNamed: "normalBrain")
        brains.position = CGPoint(x: 25, y: self.size.height-60)
        addChild(brains)
        
        let brainsLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        brainsLabel.fontSize = 30
        brainsLabel.fontColor = SKColor.white
        brainsLabel.position = CGPoint(x: 50, y: self.size.height-70)
        brainsLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        
        brainsLabel.text = "  \(GameHandler.sharedInstance.brains!)"
        addChild(brainsLabel)
        
        let highScoreLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        highScoreLabel.fontSize = 30
        highScoreLabel.fontColor = SKColor.red
        highScoreLabel.position = CGPoint(x: self.size.width / 2, y: 450)
        highScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        highScoreLabel.text = "Highscore: \(GameHandler.sharedInstance.highScore!)"
        addChild(highScoreLabel)
  
        let scoreLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        scoreLabel.fontSize = 45
        scoreLabel.fontColor = SKColor.white
        scoreLabel.position = CGPoint(x: self.size.width / 2, y: 300)
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        scoreLabel.text = "Score: \(GameHandler.sharedInstance.score!)"
        addChild(scoreLabel)
        
        let endGameLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        endGameLabel.fontSize = 30
        endGameLabel.fontColor = SKColor.gray
        endGameLabel.position = CGPoint(x: self.size.width / 2, y: 250)
        endGameLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        endGameLabel.text = "\(GameHandler.sharedInstance.endGameState!)"
        addChild(endGameLabel)
        
        let tryAgainLabel = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        tryAgainLabel.fontSize = 30
        tryAgainLabel.fontColor = SKColor.white
        tryAgainLabel.position = CGPoint(x: self.size.width / 2, y: 50)
        tryAgainLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        tryAgainLabel.text = "Tap To Play Again"
        addChild(tryAgainLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let transition = SKTransition.fade(withDuration: 0.5)
        let gameScene = GameScene(size: self.size)
        
        self.view?.presentScene(gameScene, transition: transition)
    }
    
    
    
}
