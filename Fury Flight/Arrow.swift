//
//  Arrow.swift
//  Fury Flight
//
//  Created by Gabe VanSolkema on 3/26/16.
//  Copyright © 2016 Gabriel VanSolkema. All rights reserved.
//

import UIKit
import SpriteKit

class Arrow: SKSpriteNode {
    
    let arrowTexture = SKTexture(imageNamed: "Arrow.png")
    //var coinTextures = [SKTexture]()
    
    
    init() {
        
        super.init(texture: arrowTexture, color: SKColor.clearColor(), size: arrowTexture.size())
        
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.getSize())
        
        self.physicsBody!.dynamic = false
    }
    
    
    func getSize() -> CGSize {
        
        var size = arrowTexture.size()
        size.height /= 10
        size.width /= 1.7
        return size
    }
    

    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
