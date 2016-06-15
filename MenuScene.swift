//
//  MenuScene.swift
//  Fury Flight
//
//  Created by Gabe VanSolkema on 3/28/16.
//  Copyright © 2016 Gabriel VanSolkema. All rights reserved.
//

import Foundation
import SpriteKit

class MenuScene: SKScene {
    
    var menuSprite = SKSpriteNode()
    var textSprite = SKSpriteNode()
    
    var logo = SKLabelNode()
    
    override func didMoveToView(view: SKView) {
        
        //self.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1.0)
        //self.backgroundColor = UIColor(red: 173/255, green: 211/255, blue: 255/255, alpha: 1.0)
        //self.backgroundColor = UIColor(red: 84/255, green: 163/255, blue: 255/255, alpha: 0.8)
        self.backgroundColor = UIColor(red: 109/255, green: 204/255, blue: 255/255, alpha: 1.0)
        
        

        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        if let location = touches.first?.locationInNode(self) {
            let touchedNode = nodeAtPoint(location)
            
            if touchedNode == menuSprite {
                let transition = SKTransition.revealWithDirection(.Down, duration: 1.0)
                
                let nextScene = GameScene(size: scene!.size)
                nextScene.scaleMode = .AspectFill
                
                scene?.view?.presentScene(nextScene, transition: transition)
            }
        }
    }
    
    
}
