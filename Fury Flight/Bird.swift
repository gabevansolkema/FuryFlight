//
//  Bird.swift
//  Fury Flight
//
//  Created by Gabriel VanSolkema on 12/18/15.
//  Copyright © 2015 Gabriel VanSolkema. All rights reserved.
//

import UIKit
import SpriteKit

class Bird: SKSpriteNode {
    
    let birdTexture0 = SKTexture(imageNamed: "FuryBird1.png")
    let birdTexture1 = SKTexture(imageNamed: "FuryBird2.png")
    let birdTexture2 = SKTexture(imageNamed: "FuryBird3.png")
    let birdTexture3 = SKTexture(imageNamed: "FuryBird4.png")
    let birdTexture4 = SKTexture(imageNamed: "FuryBird5.png")
    let birdTexture5 = SKTexture(imageNamed: "FuryBird6.png")
    let eagleTexture0 = SKTexture(imageNamed: "Eagle0.png")
    let eagleTexture1 = SKTexture(imageNamed: "Eagle1.png")
    let eagleTexture2 = SKTexture(imageNamed: "Eagle2.png")
    let eagleTexture3 = SKTexture(imageNamed: "Eagle3.png")
    var birdTextures = [SKTexture]()
    var eagleTextures = [SKTexture]()
    
    
    
    init() {

        super.init(texture: eagleTexture0, color: SKColor.clearColor(), size: eagleTexture0.size())
        eagleTextures = [eagleTexture0, eagleTexture1, eagleTexture2, eagleTexture3, eagleTexture3, eagleTexture2, eagleTexture1, eagleTexture0]
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.getSize().height/5.2)
        self.physicsBody!.dynamic = false
        //self.setScale(0.9)
        
        self.flap()
    }
    
    
    func newGame() {
        self.physicsBody!.dynamic = false
        self.alpha = 0.7
    }
    
    
    func begin() {
        self.runAction(SKAction.fadeInWithDuration(1.5))
        self.physicsBody!.dynamic = true
    }
    
    
    
    func flap() {
        self.runAction(getFlap())
    }
    
    
    
    
    func gotCoin() {
        self.runAction(SKAction.sequence([self.getHover(), self.getFlap()]))
    }
    
    
    
    
    func rise() {
        self.runAction(SKAction.rotateToAngle(0.6, duration: 0.6))
    }
    
    
    
    
    func fall() {
        self.runAction(SKAction.rotateToAngle(0, duration: 1.0))
    }
    
    
    
    
    func getSize() -> CGSize {
        return eagleTexture0.size()
    }
    
    
    
    
    func getHover() -> SKAction {
        return SKAction.repeatAction(SKAction.animateWithTextures([eagleTexture0], timePerFrame: 0.7), count: 1)
    }
    
    
    
    
    func getFlap() -> SKAction {
        return SKAction.repeatActionForever(SKAction.animateWithTextures(eagleTextures, timePerFrame: 0.05))
    }
    
    
    func impulse(n: CGFloat) {
        self.physicsBody!.velocity = CGVectorMake(0, 0)
        self.physicsBody!.applyImpulse(CGVectorMake(0, n))
    }
    
    
    func fade() {
        self.alpha = 0.2
        self.runAction(SKAction.fadeInWithDuration(3))
    }
    
    
    func die() {
        self.alpha = 0.4
    }
    
    

    
    
    
 
//    func assignPBody() {
//        
//        self.anchorPoint.x = 0.0
//        self.anchorPoint.y = 0.0
//        
//        let path: CGMutablePathRef = CGPathCreateMutable();
//        
//        MoveToPoint2(path, x: 15, y: 26, node: self)
//        AddLineToPoint2(path, x: 14, y: 24, node: self)
//        AddLineToPoint2(path, x: 14, y: 20, node: self)
//        AddLineToPoint2(path, x: 17, y: 16, node: self)
//        AddLineToPoint2(path, x: 21, y: 15, node: self)
//        AddLineToPoint2(path, x: 24, y: 15, node: self)
//        AddLineToPoint2(path, x: 29, y: 17, node: self)
//        AddLineToPoint2(path, x: 32, y: 20, node: self)
//        AddLineToPoint2(path, x: 33, y: 20, node: self)
//        AddLineToPoint2(path, x: 38, y: 23, node: self)
//        AddLineToPoint2(path, x: 39, y: 25, node: self)
//        AddLineToPoint2(path, x: 33, y: 27, node: self)
//        AddLineToPoint2(path, x: 25, y: 30, node: self)
//        AddLineToPoint2(path, x: 20, y: 30, node: self)
//        
//        CGPathCloseSubpath(path)
//        
//        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
//        
//    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    func offset(node: SKSpriteNode, isX: Bool)->CGFloat {
//        return isX ? node.frame.size.width * node.anchorPoint.x : node.frame.size.height * node.anchorPoint.y
//    }
//    
//    func AddLineToPoint(path: CGMutablePath!, x: CGFloat, y: CGFloat, node: SKSpriteNode) {
//        CGPathAddLineToPoint(path, nil, (x) - offset(node, isX: true), (y) - offset(node, isX: false))
//    }
//    
//    func AddLineToPoint2(path: CGMutablePath!, x: CGFloat, y: CGFloat, node: SKSpriteNode) {
//        CGPathAddLineToPoint(path, nil, (x*2) - offset(node, isX: true), (y*2) - offset(node, isX: false))
//    }
//    
//    func MoveToPoint(path: CGMutablePath!, x: CGFloat, y: CGFloat, node: SKSpriteNode) {
//        CGPathMoveToPoint(path, nil, (x) - offset(node, isX: true), (y) - offset(node, isX: false))
//    }
//    
//    func MoveToPoint2(path: CGMutablePath!, x: CGFloat, y: CGFloat, node: SKSpriteNode) {
//        CGPathMoveToPoint(path, nil, (x*2) - offset(node, isX: true), (y*2) - offset(node, isX: false))
//    }
    
}
