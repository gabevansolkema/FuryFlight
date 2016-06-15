//
//  GameScene.swift
//  Fury Flight
//
//  Created by Gabriel VanSolkema on 12/15/15.
//  Copyright (c) 2015 Gabriel VanSolkema. All rights reserved.
//

import SpriteKit
import UIKit


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var score = 0
    
    var introContainer = SKLabelNode()
    var introLabel = SKLabelNode()
    
    var touching = false
    
    var movingObjects = SKSpriteNode()
    
    var bg = SKSpriteNode()
    
    var ball = SKSpriteNode()
    
    let bird = Bird()
    
    var ground = SKNode()
    var ceiling = SKNode()
    
    var fingersTouching = 0
    
    var injured = false
    
    var prevIslandHeight: CGFloat = 0.0
    
    var lives: Int = 3
    
    var gameOver = false
    
    var gameStarted = false
    
    var bgNumber = 1
    
    var replayMenu = ReplayMenuView()
    var scoreBar = ScoreBarView()
    
    var checkReplayTimer = NSTimer()
    var coinTimer = NSTimer()
    var islandTimer = NSTimer()
    var arrowTimer = NSTimer()
    var heartTimer = NSTimer()
    
    var movingObjectsContainer = SKSpriteNode()
    
    enum ColliderType: UInt32 {
    
        case Bird = 1
        case Coin = 2
        case Object = 4
        case Heart = 8
        case Barrier = 16
    
    }
    
    
    
    
    /* --------------------------------------------------------------- */
    // Creates, animates, and adds the background
    /* --------------------------------------------------------------- */
    func makeBackground() {
        
        let bgTexture1 = SKTexture(imageNamed: "BlueSunset.jpg")
        let bgTexture2 = SKTexture(imageNamed: "BlueSunsetFlipped.jpg")
        
        let movebg1 = SKAction.moveByX(-bgTexture1.size().width, y: 0, duration: 10)
        let movebg2 = SKAction.moveByX(-bgTexture1.size().width * 2.0, y:0, duration: 20)
        let replacebg = SKAction.moveByX(bgTexture1.size().width * 2.0 - 10, y: 0, duration: 0)
        
        let movebgForever = SKAction.repeatActionForever(SKAction.sequence([movebg2, replacebg]))
        let movebgFirst = SKAction.sequence([movebg1, replacebg, movebgForever])

        let bg1 = SKSpriteNode(texture: bgTexture1)
        let bg2 = SKSpriteNode(texture: bgTexture2)
        
        bg1.position = CGPoint(x: bgTexture1.size().width / 2, y: CGRectGetMidY(self.frame))
        bg2.position = CGPoint(x: bgTexture1.size().width / 2 + bgTexture1.size().width, y: CGRectGetMidY(self.frame))
        
        bg1.size.height = self.frame.height
        bg2.size.height = self.frame.height
        
        bg1.runAction(movebgFirst)
        bg2.runAction(movebgForever)
        
        bg1.alpha = 1.0
        bg2.alpha = 1.0
        
        self.addChild(bg1)
        self.addChild(bg2)
        
        
    }
    
    
    /* ------------------------------------------------------------------- */
    // METHOD NAME
    // didMoveToView
    //
    // NOTES ON THIS METHOD
    // - Sets up the Scence
    // - Adds SKSprites and physics
    /* ------------------------------------------------------------------- */
    override func didMoveToView(view: SKView) {
        
        // Sets the contact delegate to self
        self.physicsWorld.contactDelegate = self
        
        // Sets the speed
        self.speed = 0
        
        // Adds the intro label
//        introLabel.fontName = "Helvetica"
//        introLabel.fontSize = 25
//        introLabel.text = "Tap the screen to begin..."
//        introLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 75)
//        introLabel.zPosition = 99
//        introContainer.addChild(introLabel)
//        self.addChild(introContainer)
//        
//        
//        // Adds the score label
//        scoreLabel.fontName = "Helvetica"
//        scoreLabel.fontSize = 20
//        scoreLabel.text = "Score: \(score)"
//        scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame) + 140, self.frame.size.height - 50)
//        scoreLabel.zPosition = 99
//        self.addChild(scoreLabel)
//        
//        
//        // Adds the lives label
//        livesLabel.fontName = "Helvetica"
//        livesLabel.fontSize = 20
//        livesLabel.text = "Lives: \(lives)"
//        livesLabel.position = CGPointMake(CGRectGetMidX(self.frame), self.frame.size.height - 50)
//        livesLabel.zPosition = 99
//        self.addChild(livesLabel)
        
        
        /* --------------------------------------------------------------- */
        // Creates, animates, and adds the bird
        /* --------------------------------------------------------------- */
        
        bird.position = CGPoint(x: CGRectGetMidX(self.frame) - 125, y: CGRectGetMidY(self.frame))
        //bird.fall()
        bird.newGame()
        bird.zPosition = 2.0
        

        bird.physicsBody!.categoryBitMask = ColliderType.Bird.rawValue
        bird.physicsBody!.contactTestBitMask = ColliderType.Coin.rawValue | ColliderType.Object.rawValue | ColliderType.Heart.rawValue
        bird.physicsBody!.collisionBitMask = ColliderType.Bird.rawValue | ColliderType.Barrier.rawValue
        bird.setScale(self.frame.size.height * 0.0013)
        

        
        // Adds the bird
        self.addChild(bird)
        
        makeBackground()
        makeBarriers()
        
        replayMenu = ReplayMenuView.instanceFromNib()
        
        replayMenu.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        replayMenu.frame.size = self.frame.size
        replayMenu.center = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        
        
        scoreBar = ScoreBarView.instanceFromNib()
        scoreBar.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        self.view!.addSubview(scoreBar)
        scoreBar.frame.size = self.frame.size
        scoreBar.center = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
  
//        scoreBar.center = CGPoint(x: CGRectGetMidX(self.frame) - 102, y: CGRectGetMidY(self.frame) - 44)
        
    }
    
    
    
    
    func makeCoins() {
        
        let coin = Coin()
        coin.position = CGPointMake(CGRectGetMidX(self.frame) + self.frame.size.width, CGFloat(arc4random() % UInt32(self.frame.size.height / 1.2)))
        coin.zPosition = 1.0
        let moveCoin = SKAction.moveByX(-self.frame.size.width * 2.5, y: 0, duration: NSTimeInterval(self.frame.size.width / 100))
        let removeCoin = SKAction.removeFromParent()
        let moveAndRemoveCoin = SKAction.sequence([moveCoin, removeCoin])
        coin.runAction(moveAndRemoveCoin)
        
     
        coin.physicsBody!.categoryBitMask = ColliderType.Coin.rawValue
        coin.physicsBody!.contactTestBitMask = ColliderType.Bird.rawValue
        coin.physicsBody!.collisionBitMask = ColliderType.Object.rawValue
        coin.setScale(self.frame.size.height * 0.0013)

       
        
        
        //movingObjects.addChild(coin)
        self.addChild(coin)
    }
    
    
    func makeIslands() {
        
        let island = Island()
        let random = arc4random()
        let number = UInt32(self.frame.size.height / 1.3)
        var islandHeight = CGFloat(random % number)
        
        islandHeight = fixIslandHeight(islandHeight)
        prevIslandHeight = islandHeight
        
        island.position = CGPointMake(CGRectGetMidX(self.frame) + self.frame.size.width, islandHeight)
        island.zPosition = 2.0
        let moveIsland = SKAction.moveByX(-self.frame.size.width * 2.2, y: 0, duration: NSTimeInterval(self.frame.size.width / 80))
        let removeIsland = SKAction.removeFromParent()
        let moveAndRemoveIsland = SKAction.sequence([moveIsland, removeIsland])
        island.runAction(moveAndRemoveIsland)


        island.physicsBody!.categoryBitMask = ColliderType.Object.rawValue
        island.physicsBody!.contactTestBitMask = ColliderType.Bird.rawValue
        island.physicsBody!.collisionBitMask = ColliderType.Object.rawValue
        island.setScale(self.frame.size.height * 0.0014)
        
        //movingObjects.addChild(island)
        self.addChild(island)
    }
    
    
    
    func makeArrows() {
        
        let arrow = Arrow()
        let random = arc4random()
        let number = UInt32(self.frame.size.height / 1.2)
        let arrowHeight = CGFloat(random % number)
        
        arrow.position = CGPointMake(CGRectGetMidX(self.frame) + self.frame.size.width, arrowHeight)
        arrow.zPosition = 2.0
        let moveArrow = SKAction.moveByX(-self.frame.size.width * 2.2, y: 0, duration: NSTimeInterval(self.frame.size.width / 200))
        let removeArrow = SKAction.removeFromParent()
        let moveAndRemoveArrow = SKAction.sequence([moveArrow, removeArrow])
        arrow.runAction(moveAndRemoveArrow)
        
        
        arrow.physicsBody!.categoryBitMask = ColliderType.Object.rawValue
        arrow.physicsBody!.contactTestBitMask = ColliderType.Bird.rawValue
        arrow.physicsBody!.collisionBitMask = ColliderType.Object.rawValue
        arrow.setScale(self.frame.size.height * 0.0013)

        
        //movingObjects.addChild(arrow)
        self.addChild(arrow)
    }
    
    
    func makeHearts() {
        
        let heart = Heart()
        let random = arc4random()
        let number = UInt32(self.frame.size.height / 1.2)
        let heartHeight = CGFloat(random % number)
        
        heart.position = CGPointMake(CGRectGetMidX(self.frame) + self.frame.size.width, heartHeight)
        heart.zPosition = 2.0
        let moveHeart = SKAction.moveByX(-self.frame.size.width * 2.2, y: 0, duration: NSTimeInterval(self.frame.size.width / 120))
        let removeHeart = SKAction.removeFromParent()
        let moveAndRemoveHeart = SKAction.sequence([moveHeart, removeHeart])
        heart.runAction(moveAndRemoveHeart)
        
        
        heart.physicsBody!.categoryBitMask = ColliderType.Heart.rawValue
        heart.physicsBody!.contactTestBitMask = ColliderType.Bird.rawValue
        heart.physicsBody!.collisionBitMask = ColliderType.Object.rawValue
        
        //movingObjects.addChild(heart)
        self.addChild(heart)
    }
    
    
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        let firstBody:SKPhysicsBody
        let secondBody:SKPhysicsBody
        
        if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
            firstBody = contact.bodyA;
            secondBody = contact.bodyB;
            
        } else {
            firstBody = contact.bodyB;
            secondBody = contact.bodyA;
            
        }
        
   
        if let tempBird = firstBody.node as? Bird {
            //call a function in the class
            if (!gameOver) {
                tempBird.gotCoin()
                if(fingersTouching > 0) {
                    //tempBird.rise()
                } else {
                    //tempBird.fall()
                }
            }
       
            
        }
    
        if (firstBody.categoryBitMask == ColliderType.Bird.rawValue && secondBody.categoryBitMask == ColliderType.Coin.rawValue) {
            
            if (!gameOver) {
                self.addScore()
                let secondNode = secondBody.node
                self.coinAnimation(secondNode!.position)
                secondNode!.runAction(SKAction.removeFromParent())
            }
    
        }
        
        if (firstBody.categoryBitMask == ColliderType.Bird.rawValue && secondBody.categoryBitMask == ColliderType.Object.rawValue) {
           
            if (!injured && !gameOver) {
                
                injured = true
                lives -= 1
                scoreBar.loseLife(lives)
                checkDeath()
                healStart()
                //let secondNode = secondBody.node
                damageAnimation(bird.position)
                heartAnimation(bird.position)
                
                if (lives > 0) {
                    bird.fade()
                } else {
                    bird.die()
                }
            }
  
            
        }
        
        if (firstBody.categoryBitMask == ColliderType.Bird.rawValue && secondBody.categoryBitMask == ColliderType.Heart.rawValue) {
            
            if (!gameOver) {
                self.addLife()
                let secondNode = secondBody.node
                self.healthAnimation(secondNode!.position)
                self.heartAnimation(secondNode!.position)
                secondNode!.runAction(SKAction.removeFromParent())
            }
            
        }
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        if (!gameStarted && !gameOver) {
            gameStarted = true
            self.startGame()
        }
        
        if (!gameOver) {
            fingersTouching++
        
            if (touching) {
                return
            } else {
                touching = true;
                bird.rise()
            }
        }
        
    }
    

    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        fingersTouching--
        
        if (fingersTouching == 0) {
            touching = false;
            bird.fall()
        }
        
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if (!gameOver) {
//            self.trailAnimation(bird.position)
            if (touching) {
                bird.impulse(self.frame.size.height * 0.025)
            }
        }
    }
    
    func startGame() {
        bird.begin()
        self.speed = 1.2
        introContainer.removeAllChildren()
        coinTimer = NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: Selector("makeCoins"), userInfo: nil, repeats: true)
        islandTimer = NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: Selector("makeIslands"), userInfo: nil, repeats: true)
        arrowTimer = NSTimer.scheduledTimerWithTimeInterval(1.4, target: self, selector: Selector("makeArrows"), userInfo: nil, repeats: true)
        heartTimer = NSTimer.scheduledTimerWithTimeInterval(10 + Double(arc4random_uniform(6)), target: self, selector: Selector("makeHearts"), userInfo: nil, repeats: true)
    }
    
    
    func healStart() {
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("heal"), userInfo: nil, repeats: false)
    }
    
    func heal() {
        injured = false
    }
    
    func addScore() {
        score += 1
        scoreBar.updateScore(score)
    }
    
    func addLife() {
        lives += 1
        scoreBar.addLife(lives)
    }
    
    func checkDeath() {
        if (lives <= 0) {
            gameOver = true
            gameStarted = false
            
            bird.physicsBody!.collisionBitMask = ColliderType.Bird.rawValue
            bird.impulse(self.frame.size.height * 0.025)
            
            SCORE = score
            self.view!.addSubview(replayMenu)
            replayMenu.updateScore(score)
            replayMenu.hidden = false

        
            //_ = NSTimer(timeInterval: 0.2, target: self, selector: Selector("checkReplay"), userInfo: nil, repeats: true)
            
            checkReplayTimer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("checkReplay"), userInfo: nil, repeats: true)

        }
        
    }
    
    
    
    func fixIslandHeight(var islandHeight: CGFloat) -> CGFloat {
        if (islandHeight - prevIslandHeight >= -100 && islandHeight - prevIslandHeight <= 0) {
            if (islandHeight >= 250) {
                islandHeight -= 250
                return islandHeight
            }
            if (islandHeight < 300 && islandHeight >= 150) {
                islandHeight -= 150
                return islandHeight
            }
            if (islandHeight < 150) {
                islandHeight += 350
                return islandHeight
            }
        }
        
        if (islandHeight - prevIslandHeight >= 0 && islandHeight - prevIslandHeight <= 100) {
            if (islandHeight >= 500) {
                islandHeight -= 300
                return islandHeight
            }
            if (islandHeight > 350 && islandHeight < 500) {
                islandHeight += 100
                return islandHeight
            }
            if (islandHeight <= 350) {
                islandHeight += 250
                return islandHeight
            }
            
        }
        
        return islandHeight
    }
    
    
    
    
    func offset(node: SKSpriteNode, isX: Bool)->CGFloat {
        return isX ? node.frame.size.width * node.anchorPoint.x : node.frame.size.height * node.anchorPoint.y
    }
    
    func AddLineToPoint(path: CGMutablePath!, x: CGFloat, y: CGFloat, node: SKSpriteNode) {
        CGPathAddLineToPoint(path, nil, (x * 2) - offset(node, isX: true), (y * 2) - offset(node, isX: false))
    }
    
    func MoveToPoint(path: CGMutablePath!, x: CGFloat, y: CGFloat, node: SKSpriteNode) {
        CGPathMoveToPoint(path, nil, (x * 2) - offset(node, isX: true), (y * 2) - offset(node, isX: false))
    }
    
    
    
    
    func coinAnimation(position: CGPoint) {
        var location = position
        location.x -= 20
        let coinParticle = SKEmitterNode(fileNamed: "CoinParticle.sks")
        coinParticle!.position = location
        coinParticle!.zPosition = 999
        
        self.addChild(coinParticle!)
    }
    
    func healthAnimation(position: CGPoint) {
        var location = position
        location.x -= 20
        let healthParticle = SKEmitterNode(fileNamed: "HealthParticle.sks")
        healthParticle!.position = location
        healthParticle!.zPosition = 999
        
        self.addChild(healthParticle!)
    }
    
    func damageAnimation(position: CGPoint) {
        var location = position
        location.x -= 20
        let damageParticle = SKEmitterNode(fileNamed: "damageParticle.sks")
        damageParticle!.position = location
        damageParticle!.zPosition = 999
        
        self.addChild(damageParticle!)
    }
    
    func heartAnimation(position: CGPoint) {
        var location = position
        location.x -= 20
        let heartParticle = SKEmitterNode(fileNamed: "heartParticle.sks")
        heartParticle!.position = location
        heartParticle!.zPosition = 999
        
        
        self.addChild(heartParticle!)
    }
    
    func checkReplay() {
        if (REPLAY == true) {
            REPLAY = false
            self.replayMenu.hidden = true
            killTimers()
            replayGame()
        }
    }
    
    
    
    func replayGame() {
        self.removeAllChildren()
    
        makeBackground()
        makeBarriers()
        self.speed = 0
        gameOver = false
        gameStarted = false
        fingersTouching = 0
        lives = 3
        score = 0
        scoreBar.reset()
        bird.newGame()
        bird.position = CGPoint(x: CGRectGetMidX(self.frame) - 125, y: CGRectGetMidY(self.frame))
        bird.physicsBody!.collisionBitMask = ColliderType.Bird.rawValue | ColliderType.Barrier.rawValue
        self.addChild(bird)
    }
    
    
    func killTimers() {
        checkReplayTimer.invalidate()
        coinTimer.invalidate()
        islandTimer.invalidate()
        arrowTimer.invalidate()
        heartTimer.invalidate()
        
    }
    
    
    func makeBarriers() {
        /* --------------------------------------------------------------- */
        // Creates, animates, and adds the ground
        /* --------------------------------------------------------------- */
        ground = SKNode()
        ground.position = CGPointMake(0, CGRectGetMinY(self.frame) - 5)
        
        // Physics for the ceiling
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.width, 1))
        ground.physicsBody!.dynamic = false
        ground.physicsBody!.categoryBitMask = ColliderType.Barrier.rawValue
        ground.physicsBody!.contactTestBitMask = ColliderType.Object.rawValue
        ground.physicsBody!.collisionBitMask = ColliderType.Object.rawValue
        
        self.addChild(ground)
        
        
        
        /* --------------------------------------------------------------- */
        // Creates, animates, and adds the ceiling
        /* --------------------------------------------------------------- */
        ceiling = SKNode()
        ceiling.position = CGPointMake(0, CGRectGetMaxY(self.frame) + 5)
        
        // Physics for the ground
        ceiling.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.width, 1))
        ceiling.physicsBody!.dynamic = false
        ceiling.physicsBody!.categoryBitMask = ColliderType.Barrier.rawValue
        ceiling.physicsBody!.contactTestBitMask = ColliderType.Object.rawValue
        ceiling.physicsBody!.collisionBitMask = ColliderType.Object.rawValue
        
        self.addChild(ceiling)

    }

}








