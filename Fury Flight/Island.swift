//
//  Island.swift
//  Fury Flight
//
//  Created by Gabe VanSolkema on 3/20/16.
//  Copyright © 2016 Gabriel VanSolkema. All rights reserved.
//

import UIKit
import SpriteKit

class Island: SKSpriteNode {
    
//    let islandTexture0 = SKTexture(imageNamed: "IslandMutedEdited.jpg")
    let islandTexture0 = SKTexture(imageNamed: "Island0.png")
    let islandTexture1 = SKTexture(imageNamed: "Island1.png")
    let islandTexture2 = SKTexture(imageNamed: "Island2.png")
    let islandTexture3 = SKTexture(imageNamed: "Island3.png")
    let islandTexture4 = SKTexture(imageNamed: "Island4.png")
    let islandTexture5 = SKTexture(imageNamed: "Island5.png")
    let islandTexture6 = SKTexture(imageNamed: "Island6.png")
    let islandTexture7 = SKTexture(imageNamed: "Island7.png")
    let islandTexture8 = SKTexture(imageNamed: "Island8.png")
    let islandTexture9 = SKTexture(imageNamed: "Island9.png")
    let islandTexture10 = SKTexture(imageNamed: "Island10.png")
    let islandTexture11 = SKTexture(imageNamed: "Island11.png")
    let islandTexture12_1 = SKTexture(imageNamed: "Island12_1.png")
    let islandTexture12_2 = SKTexture(imageNamed: "Island12_2.png")
    let islandTexture12_3 = SKTexture(imageNamed: "Island12_3.png")
    let islandTexture12_4 = SKTexture(imageNamed: "Island12_4.png")
    let islandTexture13 = SKTexture(imageNamed: "Island13.png")
    let islandTexture14 = SKTexture(imageNamed: "Island14.png")
    let islandTexture15 = SKTexture(imageNamed: "Island15.png")
    
    let islandType : Int
    
    
    
    init() {
        
        //islandType = 12
        islandType = Int(arc4random_uniform(16))
        
        super.init(texture: islandTexture0, color: SKColor.clearColor(), size: islandTexture0.size())
        
        self.assignPBody()
        self.physicsBody?.dynamic = false
        self.fadeIn()
        self.zPosition = -5
    }
    
    
    
    func getSize() -> CGSize {
        
        return islandTexture0.size()
        
    }
    
    
    func fadeIn() {
        self.alpha = 0.4
        self.runAction(SKAction.fadeInWithDuration(3.2))
    }
    
    
    func assignPBody() -> SKPhysicsBody {
        
        if (islandType == 0) {
            self.size = islandTexture0.size()
            self.texture = islandTexture0
            self.makeBody0()
        }
        
        if (islandType == 1) {
            self.size = islandTexture1.size()
            self.texture = islandTexture1
            self.makeBody1()
        }
        
        if (islandType == 2) {
            self.size = islandTexture2.size()
            self.texture = islandTexture2
            self.makeBody2()
        }
        
        if (islandType == 3) {
            self.size = islandTexture3.size()
            self.texture = islandTexture3
            self.makeBody3()
        }
        
        if (islandType == 4) {
            self.size = islandTexture4.size()
            self.texture = islandTexture4
            self.makeBody4()        }
        
        if (islandType == 5) {
            self.size = islandTexture5.size()
            self.texture = islandTexture5
            self.makeBody5()
        }
        
        if (islandType == 6) {
            self.size = islandTexture6.size()
            self.texture = islandTexture6
            self.makeBody6()
        }
        
        if (islandType == 7) {
            self.size = islandTexture7.size()
            self.texture = islandTexture7
            self.makeBody7()
        }
        
        if (islandType == 8) {
            self.size = islandTexture8.size()
            self.texture = islandTexture8
            self.makeBody8()
        }
        
        if (islandType == 9) {
            self.size = islandTexture9.size()
            self.texture = islandTexture9
            self.makeBody9()
        }
        
        if (islandType == 10) {
            self.size = islandTexture10.size()
            self.texture = islandTexture10
            self.makeBody10()
            }
        
        if (islandType == 11) {
            self.size = islandTexture11.size()
            self.texture = islandTexture11
            self.makeBody11()
            }
        
        if (islandType == 12) {
            self.size = islandTexture12_1.size()
            self.texture = islandTexture12_1
            self.fire()
            self.makeBody12()
            }
        
        if (islandType == 13) {
            self.size = islandTexture13.size()
            self.texture = islandTexture13
            self.makeBody13()
            }
        
        if (islandType == 14) {
            self.size = islandTexture14.size()
            self.texture = islandTexture14
            self.makeBody14()
            }
        
        if (islandType == 15) {
            self.size = islandTexture15.size()
            self.texture = islandTexture15
            self.makeBody15()
        }
            
        return self.physicsBody!
    }
    
    
    func makeBody0() {
    
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint(path, x: 0, y: 83, node: self)
        AddLineToPoint(path, x: 0, y: 61, node: self)
        AddLineToPoint(path, x: 13, y: 49, node: self)
        AddLineToPoint(path, x: 13, y: 37, node: self)
        AddLineToPoint(path, x: 25, y: 25, node: self)
        AddLineToPoint(path, x: 25, y: 13, node: self)
        AddLineToPoint(path, x: 41, y: 1, node: self)
        AddLineToPoint(path, x: 52, y: 1, node: self)
        AddLineToPoint(path, x: 80, y: 13, node: self)
        AddLineToPoint(path, x: 103, y: 1, node: self)
        AddLineToPoint(path, x: 114, y: 1, node: self)
        AddLineToPoint(path, x: 138, y: 25, node: self)
        AddLineToPoint(path, x: 144, y: 13, node: self)
        AddLineToPoint(path, x: 157, y: 13, node: self)
        AddLineToPoint(path, x: 168, y: 61, node: self)
        AddLineToPoint(path, x: 168, y: 83, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)

    }
    
    
    func makeBody1() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint2(path, x: 0, y: 47, node: self)
        AddLineToPoint2(path, x: 0, y: 36, node: self)
        AddLineToPoint2(path, x: 13, y: 12, node: self)
        AddLineToPoint2(path, x: 29, y: 12, node: self)
        AddLineToPoint2(path, x: 39, y: 18, node: self)
        AddLineToPoint2(path, x: 42, y: 12, node: self)
        AddLineToPoint2(path, x: 58, y: 12, node: self)
        AddLineToPoint2(path, x: 58, y: 6, node: self)
        AddLineToPoint2(path, x: 61, y: 0, node: self)
        AddLineToPoint2(path, x: 68, y: 0, node: self)
        AddLineToPoint2(path, x: 78, y: 12, node: self)
        AddLineToPoint2(path, x: 84, y: 12, node: self)
        AddLineToPoint2(path, x: 87, y: 18, node: self)
        AddLineToPoint2(path, x: 87, y: 36, node: self)
        AddLineToPoint2(path, x: 85, y: 47, node: self)
        AddLineToPoint2(path, x: 68, y: 51, node: self)
        AddLineToPoint2(path, x: 50, y: 62, node: self)
        AddLineToPoint2(path, x: 44, y: 62, node: self)
        AddLineToPoint2(path, x: 33, y: 51, node: self)
        AddLineToPoint2(path, x: 21, y: 53, node: self)
        AddLineToPoint2(path, x: 18, y: 60, node: self)
        AddLineToPoint2(path, x: 12, y: 60, node: self)
        AddLineToPoint2(path, x: 8, y: 53, node: self)
  
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    func makeBody2() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint(path, x: 0, y: 71, node: self)
        AddLineToPoint(path, x: 0, y: 49, node: self)
        AddLineToPoint(path, x: 18, y: 37, node: self)
        AddLineToPoint(path, x: 48, y: 12, node: self)
        AddLineToPoint(path, x: 48, y: 0, node: self)
        AddLineToPoint(path, x: 60, y: 0, node: self)
        AddLineToPoint(path, x: 65, y: 12, node: self)
        AddLineToPoint(path, x: 79, y: 37, node: self)
        AddLineToPoint(path, x: 97, y: 24, node: self)
        AddLineToPoint(path, x: 138, y: 13, node: self)
        AddLineToPoint(path, x: 150, y: 13, node: self)
        AddLineToPoint(path, x: 168, y: 37, node: self)
        AddLineToPoint(path, x: 168, y: 71, node: self)
        AddLineToPoint(path, x: 156, y: 107, node: self)
        AddLineToPoint(path, x: 150, y: 119, node: self)
        AddLineToPoint(path, x: 126, y: 119, node: self)
        AddLineToPoint(path, x: 120, y: 106, node: self)
        AddLineToPoint(path, x: 88, y: 71, node: self)
        AddLineToPoint(path, x: 61, y: 131, node: self)
        AddLineToPoint(path, x: 24, y: 131, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    
    func makeBody3() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        
        MoveToPoint2(path, x: 0, y: 41, node: self)
        AddLineToPoint2(path, x: 0, y: 30, node: self)
        AddLineToPoint2(path, x: 8, y: 12, node: self)
        AddLineToPoint2(path, x: 24, y: 6, node: self)
        AddLineToPoint2(path, x: 42, y: 6, node: self)
        AddLineToPoint2(path, x: 45, y: 0, node: self)
        AddLineToPoint2(path, x: 51, y: 0, node: self)
        AddLineToPoint2(path, x: 60, y: 6, node: self)
        AddLineToPoint2(path, x: 70, y: 0, node: self)
        AddLineToPoint2(path, x: 76, y: 0, node: self)
        AddLineToPoint2(path, x: 84, y: 30, node: self)
        AddLineToPoint2(path, x: 84, y: 41, node: self)
        AddLineToPoint2(path, x: 73, y: 72, node: self)
        AddLineToPoint2(path, x: 24, y: 72, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    func makeBody4() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
    
        
        MoveToPoint2(path, x: 0, y: 42, node: self)
        AddLineToPoint2(path, x: 0, y: 30, node: self)
        AddLineToPoint2(path, x: 3, y: 24, node: self)
        AddLineToPoint2(path, x: 12, y: 24, node: self)
        AddLineToPoint2(path, x: 12, y: 12, node: self)
        AddLineToPoint2(path, x: 12, y: 6, node: self)
        AddLineToPoint2(path, x: 18, y: 6, node: self)
        AddLineToPoint2(path, x: 27, y: 12, node: self)
        AddLineToPoint2(path, x: 39, y: 12, node: self)
        AddLineToPoint2(path, x: 51, y: 0, node: self)
        AddLineToPoint2(path, x: 57, y: 0, node: self)
        AddLineToPoint2(path, x: 66, y: 30, node: self)
        AddLineToPoint2(path, x: 66, y: 42, node: self)
        AddLineToPoint2(path, x: 54, y: 42, node: self)
        AddLineToPoint2(path, x: 54, y: 96, node: self)
        AddLineToPoint2(path, x: 12, y: 96, node: self)
        AddLineToPoint2(path, x: 12, y: 42, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    
    
    func makeBody5() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint2(path, x: 0, y: 36, node: self)
        AddLineToPoint2(path, x: 0, y: 24, node: self)
        AddLineToPoint2(path, x: 18, y: 12, node: self)
        AddLineToPoint2(path, x: 21, y: 6, node: self)
        AddLineToPoint2(path, x: 28, y: 6, node: self)
        AddLineToPoint2(path, x: 28, y: 18, node: self)
        AddLineToPoint2(path, x: 72, y: 18, node: self)
        AddLineToPoint2(path, x: 73, y: 0, node: self)
        AddLineToPoint2(path, x: 79, y: 0, node: self)
        AddLineToPoint2(path, x: 79, y: 6, node: self)
        AddLineToPoint2(path, x: 93, y: 6, node: self)
        AddLineToPoint2(path, x: 103, y: 18, node: self)
        AddLineToPoint2(path, x: 108, y: 12, node: self)
        AddLineToPoint2(path, x: 115, y: 12, node: self)
        AddLineToPoint2(path, x: 115, y: 36, node: self)
        AddLineToPoint2(path, x: 104, y: 36, node: self)
        AddLineToPoint2(path, x: 104, y: 59, node: self)
        AddLineToPoint2(path, x: 101, y: 66, node: self)
        AddLineToPoint2(path, x: 83, y: 66, node: self)
        AddLineToPoint2(path, x: 72, y: 42, node: self)
        AddLineToPoint2(path, x: 59, y: 42, node: self)
        AddLineToPoint2(path, x: 59, y: 48, node: self)
        AddLineToPoint2(path, x: 52, y: 48, node: self)
        AddLineToPoint2(path, x: 40, y: 53, node: self)
        AddLineToPoint2(path, x: 38, y: 66, node: self)
        AddLineToPoint2(path, x: 19, y: 66, node: self)
        AddLineToPoint2(path, x: 15, y: 59, node: self)
        AddLineToPoint2(path, x: 14, y: 42, node: self)
        AddLineToPoint2(path, x: 8, y: 42, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    
    func makeBody6() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint2(path, x: 0, y: 42, node: self)
        AddLineToPoint2(path, x: 0, y: 30, node: self)
        AddLineToPoint2(path, x: 3, y: 12, node: self)
        AddLineToPoint2(path, x: 15, y: 12, node: self)
        AddLineToPoint2(path, x: 18, y: 6, node: self)
        AddLineToPoint2(path, x: 36, y: 6, node: self)
        AddLineToPoint2(path, x: 39, y: 0, node: self)
        AddLineToPoint2(path, x: 46, y: 0, node: self)
        AddLineToPoint2(path, x: 57, y: 12, node: self)
        AddLineToPoint2(path, x: 69, y: 12, node: self)
        AddLineToPoint2(path, x: 72, y: 6, node: self)
        AddLineToPoint2(path, x: 79, y: 6, node: self)
        AddLineToPoint2(path, x: 82, y: 12, node: self)
        AddLineToPoint2(path, x: 85, y: 30, node: self)
        AddLineToPoint2(path, x: 85, y: 41, node: self)
        AddLineToPoint2(path, x: 76, y: 47, node: self)
        AddLineToPoint2(path, x: 72, y: 50, node: self)
        AddLineToPoint2(path, x: 69, y: 68, node: self)
        AddLineToPoint2(path, x: 67, y: 81, node: self)
        AddLineToPoint2(path, x: 48, y: 81, node: self)
        AddLineToPoint2(path, x: 44, y: 50, node: self)
        AddLineToPoint2(path, x: 36, y: 48, node: self)
        AddLineToPoint2(path, x: 22, y: 48, node: self)
        AddLineToPoint2(path, x: 22, y: 54, node: self)
        AddLineToPoint2(path, x: 15, y: 54, node: self)
        AddLineToPoint2(path, x: 12, y: 42, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    
    func makeBody7() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint2(path, x: 0, y: 66, node: self)
        AddLineToPoint2(path, x: 0, y: 54, node: self)
        AddLineToPoint2(path, x: 3, y: 42, node: self)
        AddLineToPoint2(path, x: 3, y: 0, node: self)
        AddLineToPoint2(path, x: 10, y: 0, node: self)
        AddLineToPoint2(path, x: 13, y: 6, node: self)
        AddLineToPoint2(path, x: 18, y: 30, node: self)
        AddLineToPoint2(path, x: 27, y: 24, node: self)
        AddLineToPoint2(path, x: 36, y: 6, node: self)
        AddLineToPoint2(path, x: 42, y: 6, node: self)
        AddLineToPoint2(path, x: 45, y: 12, node: self)
        AddLineToPoint2(path, x: 54, y: 18, node: self)
        AddLineToPoint2(path, x: 61, y: 18, node: self)
        AddLineToPoint2(path, x: 75, y: 36, node: self)
        AddLineToPoint2(path, x: 81, y: 36, node: self)
        AddLineToPoint2(path, x: 98, y: 24, node: self)
        AddLineToPoint2(path, x: 98, y: 12, node: self)
        AddLineToPoint2(path, x: 102, y: 6, node: self)
        AddLineToPoint2(path, x: 109, y: 6, node: self)
        AddLineToPoint2(path, x: 109, y: 66, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    func makeBody8() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint(path, x: 0, y: 83, node: self)
        AddLineToPoint(path, x: 0, y: 60, node: self)
        AddLineToPoint(path, x: 18, y: 50, node: self)
        AddLineToPoint(path, x: 48, y: 37, node: self)
        AddLineToPoint(path, x: 48, y: 13, node: self)
        AddLineToPoint(path, x: 54, y: 0, node: self)
        AddLineToPoint(path, x: 67, y: 0, node: self)
        AddLineToPoint(path, x: 78, y: 49, node: self)
        AddLineToPoint(path, x: 96, y: 37, node: self)
        AddLineToPoint(path, x: 138, y: 37, node: self)
        AddLineToPoint(path, x: 138, y: 25, node: self)
        AddLineToPoint(path, x: 151, y: 25, node: self)
        AddLineToPoint(path, x: 151, y: 60, node: self)
        AddLineToPoint(path, x: 169, y: 60, node: self)
        AddLineToPoint(path, x: 169, y: 83, node: self)
        AddLineToPoint(path, x: 149, y: 108, node: self)
        AddLineToPoint(path, x: 102, y: 108, node: self)
        AddLineToPoint(path, x: 102, y: 204, node: self)
        AddLineToPoint(path, x: 41, y: 204, node: self)
        AddLineToPoint(path, x: 41, y: 108, node: self)
        AddLineToPoint(path, x: 15, y: 95, node: self)
        AddLineToPoint(path, x: 3, y: 95, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    
    func makeBody9() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint2(path, x: 0, y: 48, node: self)
        AddLineToPoint2(path, x: 0, y: 36, node: self)
        AddLineToPoint2(path, x: 3, y: 30, node: self)
        AddLineToPoint2(path, x: 3, y: 18, node: self)
        AddLineToPoint2(path, x: 7, y: 12, node: self)
        AddLineToPoint2(path, x: 12, y: 12, node: self)
        AddLineToPoint2(path, x: 18, y: 24, node: self)
        AddLineToPoint2(path, x: 24, y: 12, node: self)
        AddLineToPoint2(path, x: 24, y: 0, node: self)
        AddLineToPoint2(path, x: 30, y: 0, node: self)
        AddLineToPoint2(path, x: 34, y: 6, node: self)
        AddLineToPoint2(path, x: 45, y: 18, node: self)
        AddLineToPoint2(path, x: 66, y: 24, node: self)
        AddLineToPoint2(path, x: 66, y: 12, node: self)
        AddLineToPoint2(path, x: 69, y: 6, node: self)
        AddLineToPoint2(path, x: 77, y: 6, node: self)
        AddLineToPoint2(path, x: 77, y: 36, node: self)
        AddLineToPoint2(path, x: 84, y: 36, node: self)
        AddLineToPoint2(path, x: 84, y: 48, node: self)
        AddLineToPoint2(path, x: 79, y: 48, node: self)
        AddLineToPoint2(path, x: 79, y: 65, node: self)
        AddLineToPoint2(path, x: 75, y: 72, node: self)
        AddLineToPoint2(path, x: 63, y: 72, node: self)
        AddLineToPoint2(path, x: 60, y: 65, node: self)
        AddLineToPoint2(path, x: 60, y: 47, node: self)
        AddLineToPoint2(path, x: 53, y: 54, node: self)
        AddLineToPoint2(path, x: 47, y: 54, node: self)
        AddLineToPoint2(path, x: 36, y: 59, node: self)
        AddLineToPoint2(path, x: 36, y: 77, node: self)
        AddLineToPoint2(path, x: 32, y: 83, node: self)
        AddLineToPoint2(path, x: 20, y: 83, node: self)
        AddLineToPoint2(path, x: 17, y: 77, node: self)
        AddLineToPoint2(path, x: 17, y: 59, node: self)
        AddLineToPoint2(path, x: 5, y: 48, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    func makeBody10() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint2(path, x: 0, y: 45, node: self)
        AddLineToPoint2(path, x: 0, y: 30, node: self)
        AddLineToPoint2(path, x: 10, y: 30, node: self)
        AddLineToPoint2(path, x: 10, y: 24, node: self)
        AddLineToPoint2(path, x: 24, y: 24, node: self)
        AddLineToPoint2(path, x: 24, y: 6, node: self)
        AddLineToPoint2(path, x: 27, y: 0, node: self)
        AddLineToPoint2(path, x: 33, y: 0, node: self)
        AddLineToPoint2(path, x: 45, y: 12, node: self)
        AddLineToPoint2(path, x: 48, y: 6, node: self)
        AddLineToPoint2(path, x: 69, y: 6, node: self)
        AddLineToPoint2(path, x: 69, y: 0, node: self)
        AddLineToPoint2(path, x: 76, y: 0, node: self)
        AddLineToPoint2(path, x: 76, y: 30, node: self)
        AddLineToPoint2(path, x: 90, y: 30, node: self)
        AddLineToPoint2(path, x: 90, y: 6, node: self)
        AddLineToPoint2(path, x: 96, y: 6, node: self)
        AddLineToPoint2(path, x: 99, y: 12, node: self)
        AddLineToPoint2(path, x: 103, y: 30, node: self)
        AddLineToPoint2(path, x: 103, y: 42, node: self)
        AddLineToPoint2(path, x: 85, y: 42, node: self)
        AddLineToPoint2(path, x: 85, y: 83, node: self)
        AddLineToPoint2(path, x: 92, y: 93, node: self)
        AddLineToPoint2(path, x: 81, y: 96, node: self)
        AddLineToPoint2(path, x: 81, y: 84, node: self)
        AddLineToPoint2(path, x: 54, y: 84, node: self)
        AddLineToPoint2(path, x: 45, y: 45, node: self)
        AddLineToPoint2(path, x: 40, y: 65, node: self)
        AddLineToPoint2(path, x: 26, y: 80, node: self)
        AddLineToPoint2(path, x: 7, y: 80, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    func makeBody11() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint2(path, x: 0, y: 48, node: self)
        AddLineToPoint2(path, x: 0, y: 36, node: self)
        AddLineToPoint2(path, x: 9, y: 18, node: self)
        AddLineToPoint2(path, x: 9, y: 6, node: self)
        AddLineToPoint2(path, x: 12, y: 0, node: self)
        AddLineToPoint2(path, x: 19, y: 0, node: self)
        AddLineToPoint2(path, x: 19, y: 12, node: self)
        AddLineToPoint2(path, x: 39, y: 12, node: self)
        AddLineToPoint2(path, x: 39, y: 6, node: self)
        AddLineToPoint2(path, x: 45, y: 6, node: self)
        AddLineToPoint2(path, x: 49, y: 12, node: self)
        AddLineToPoint2(path, x: 49, y: 48, node: self)
        AddLineToPoint2(path, x: 41, y: 48, node: self)
        AddLineToPoint2(path, x: 41, y: 52, node: self)
        AddLineToPoint2(path, x: 7, y: 52, node: self)
        AddLineToPoint2(path, x: 7, y: 48, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    
    func makeBody12() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint2(path, x: 0, y: 42, node: self)
        AddLineToPoint2(path, x: 0, y: 18, node: self)
        AddLineToPoint2(path, x: 6, y: 18, node: self)
        AddLineToPoint2(path, x: 18, y: 24, node: self)
        AddLineToPoint2(path, x: 18, y: 6, node: self)
        AddLineToPoint2(path, x: 20, y: 0, node: self)
        AddLineToPoint2(path, x: 28, y: 0, node: self)
        AddLineToPoint2(path, x: 28, y: 18, node: self)
        AddLineToPoint2(path, x: 39, y: 12, node: self)
        AddLineToPoint2(path, x: 51, y: 12, node: self)
        AddLineToPoint2(path, x: 57, y: 0, node: self)
        AddLineToPoint2(path, x: 63, y: 0, node: self)
        AddLineToPoint2(path, x: 67, y: 6, node: self)
        AddLineToPoint2(path, x: 67, y: 24, node: self)
        AddLineToPoint2(path, x: 73, y: 30, node: self)
        AddLineToPoint2(path, x: 73, y: 42, node: self)
        AddLineToPoint2(path, x: 67, y: 46, node: self)
        AddLineToPoint2(path, x: 62, y: 65, node: self)
        AddLineToPoint2(path, x: 52, y: 46, node: self)
        AddLineToPoint2(path, x: 40, y: 46, node: self)
        AddLineToPoint2(path, x: 31, y: 65, node: self)
        AddLineToPoint2(path, x: 23, y: 46, node: self)
        AddLineToPoint2(path, x: 23, y: 42, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    
    func makeBody13() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint2(path, x: 0, y: 48, node: self)
        AddLineToPoint2(path, x: 0, y: 36, node: self)
        AddLineToPoint2(path, x: 3, y: 24, node: self)
        AddLineToPoint2(path, x: 3, y: 6, node: self)
        AddLineToPoint2(path, x: 6, y: 0, node: self)
        AddLineToPoint2(path, x: 12, y: 0, node: self)
        AddLineToPoint2(path, x: 18, y: 12, node: self)
        AddLineToPoint2(path, x: 48, y: 12, node: self)
        AddLineToPoint2(path, x: 66, y: 36, node: self)
        AddLineToPoint2(path, x: 66, y: 47, node: self)
        AddLineToPoint2(path, x: 56, y: 53, node: self)
        AddLineToPoint2(path, x: 50, y: 53, node: self)
        AddLineToPoint2(path, x: 40, y: 52, node: self)
        AddLineToPoint2(path, x: 29, y: 52, node: self)
        AddLineToPoint2(path, x: 26, y: 64, node: self)
        AddLineToPoint2(path, x: 19, y: 64, node: self)
        AddLineToPoint2(path, x: 16, y: 51, node: self)
        AddLineToPoint2(path, x: 7, y: 51, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    
    func makeBody14() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint2(path, x: 0, y: 59, node: self)
        AddLineToPoint2(path, x: 0, y: 48, node: self)
        AddLineToPoint2(path, x: 9, y: 48, node: self)
        AddLineToPoint2(path, x: 9, y: 30, node: self)
        AddLineToPoint2(path, x: 24, y: 30, node: self)
        AddLineToPoint2(path, x: 24, y: 12, node: self)
        AddLineToPoint2(path, x: 30, y: 0, node: self)
        AddLineToPoint2(path, x: 37, y: 0, node: self)
        AddLineToPoint2(path, x: 46, y: 6, node: self)
        AddLineToPoint2(path, x: 49, y: 12, node: self)
        AddLineToPoint2(path, x: 49, y: 59, node: self)
        AddLineToPoint2(path, x: 40, y: 76, node: self)
        AddLineToPoint2(path, x: 33, y: 76, node: self)
        AddLineToPoint2(path, x: 30, y: 63, node: self)
        AddLineToPoint2(path, x: 14, y: 63, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    
    func makeBody15() {
        
        self.anchorPoint.x = 0.0
        self.anchorPoint.y = 0.0
        
        let path: CGMutablePathRef = CGPathCreateMutable();
        
        MoveToPoint2(path, x: 0, y: 54, node: self)
        AddLineToPoint2(path, x: 0, y: 42, node: self)
        AddLineToPoint2(path, x: 6, y: 30, node: self)
        AddLineToPoint2(path, x: 6, y: 18, node: self)
        AddLineToPoint2(path, x: 12, y: 6, node: self)
        AddLineToPoint2(path, x: 27, y: 6, node: self)
        AddLineToPoint2(path, x: 27, y: 0, node: self)
        AddLineToPoint2(path, x: 33, y: 0, node: self)
        AddLineToPoint2(path, x: 45, y: 24, node: self)
        AddLineToPoint2(path, x: 56, y: 12, node: self)
        AddLineToPoint2(path, x: 63, y: 12, node: self)
        AddLineToPoint2(path, x: 78, y: 35, node: self)
        AddLineToPoint2(path, x: 78, y: 6, node: self)
        AddLineToPoint2(path, x: 84, y: 6, node: self)
        AddLineToPoint2(path, x: 88, y: 12, node: self)
        AddLineToPoint2(path, x: 88, y: 36, node: self)
        AddLineToPoint2(path, x: 91, y: 42, node: self)
        AddLineToPoint2(path, x: 91, y: 59, node: self)
        AddLineToPoint2(path, x: 87, y: 65, node: self)
        AddLineToPoint2(path, x: 82, y: 102, node: self)
        AddLineToPoint2(path, x: 78, y: 83, node: self)
        AddLineToPoint2(path, x: 78, y: 54, node: self)
        AddLineToPoint2(path, x: 51, y: 54, node: self)
        AddLineToPoint2(path, x: 51, y: 58, node: self)
        AddLineToPoint2(path, x: 45, y: 89, node: self)
        AddLineToPoint2(path, x: 26, y: 89, node: self)
        AddLineToPoint2(path, x: 15, y: 62, node: self)
        AddLineToPoint2(path, x: 4, y: 66, node: self)
        AddLineToPoint2(path, x: 4, y: 54, node: self)
        
        CGPathCloseSubpath(path)
        
        self.physicsBody = SKPhysicsBody(polygonFromPath: path)
        
    }
    
    
    func getBody() -> SKPhysicsBody {
        return self.physicsBody!
        
    }
    
    func fire() {
        let islandTextures = [islandTexture12_1, islandTexture12_2, islandTexture12_3, islandTexture12_4]
        self.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(islandTextures, timePerFrame: 0.20)))
    }
    
    
    func offset(node: SKSpriteNode, isX: Bool)->CGFloat {
        return isX ? node.frame.size.width * node.anchorPoint.x : node.frame.size.height * node.anchorPoint.y
    }
    
    func AddLineToPoint(path: CGMutablePath!, x: CGFloat, y: CGFloat, node: SKSpriteNode) {
        CGPathAddLineToPoint(path, nil, (x) - offset(node, isX: true), (y) - offset(node, isX: false))
    }
    
    func AddLineToPoint2(path: CGMutablePath!, x: CGFloat, y: CGFloat, node: SKSpriteNode) {
        CGPathAddLineToPoint(path, nil, (x*2) - offset(node, isX: true), (y*2) - offset(node, isX: false))
    }
    
    func MoveToPoint(path: CGMutablePath!, x: CGFloat, y: CGFloat, node: SKSpriteNode) {
        CGPathMoveToPoint(path, nil, (x) - offset(node, isX: true), (y) - offset(node, isX: false))
    }
    
    func MoveToPoint2(path: CGMutablePath!, x: CGFloat, y: CGFloat, node: SKSpriteNode) {
        CGPathMoveToPoint(path, nil, (x*2) - offset(node, isX: true), (y*2) - offset(node, isX: false))
    }
  
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}