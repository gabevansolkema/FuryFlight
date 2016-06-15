//
//  Coin.swift
//  Fury Flight
//
//  Created by Gabriel VanSolkema on 12/19/15.
//  Copyright © 2015 Gabriel VanSolkema. All rights reserved.
//

import UIKit
import SpriteKit

class Coin: SKSpriteNode {

    let coinTexture1 = SKTexture(imageNamed: "coin_1.png")
    let coinTexture2 = SKTexture(imageNamed: "coin_2.png")
    let coinTexture3 = SKTexture(imageNamed: "coin_3.png")
    let coinTexture4 = SKTexture(imageNamed: "coin_4.png")
    let coinTexture5 = SKTexture(imageNamed: "coin_5.png")
    let coinTexture6 = SKTexture(imageNamed: "coin_6.png")
    var coinTextures = [SKTexture]()
    
    
    init() {
        
        super.init(texture: coinTexture1, color: SKColor.clearColor(), size: coinTexture1.size())
        
        coinTextures = [coinTexture1, coinTexture2, coinTexture3, coinTexture4, coinTexture5, coinTexture6]
        
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.getSize())
        self.physicsBody!.dynamic = false
        //self.setScale(0.85)
        
        self.spin()
    }
    
    
    
    func spin() {
        self.runAction(getSpin())
    }
    
    
    
    func getSpin() -> SKAction {
        return SKAction.repeatActionForever(SKAction.animateWithTextures(coinTextures, timePerFrame: 0.08))
    }

    
    
    func getSize() -> CGSize {
        return coinTexture1.size()
    }

    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
