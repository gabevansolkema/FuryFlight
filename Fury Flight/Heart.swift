//
//  Heart.swift
//  Fury Flight
//
//  Created by Gabe VanSolkema on 3/26/16.
//  Copyright © 2016 Gabriel VanSolkema. All rights reserved.
//

import UIKit
import SpriteKit

class Heart: SKSpriteNode {
    
    let heartTexture = SKTexture(imageNamed: "Heart0.png")
    //var coinTextures = [SKTexture]()
    
    
    init() {
        
        super.init(texture: heartTexture, color: SKColor.clearColor(), size: heartTexture.size())
        
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.getSize())
        self.physicsBody!.dynamic = false
        self.setScale(0.85)
        
    }
    
    
    func getSize() -> CGSize {
        
        let size = heartTexture.size()
//        size.height /= 10
//        size.width /= 1.7
        return size
    }
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}