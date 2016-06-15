//
//  GameViewController.swift
//  Fury Flight
//
//  Created by Gabriel VanSolkema on 12/15/15.
//  Copyright (c) 2015 Gabriel VanSolkema. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    

    @IBOutlet weak var PlayGameButton: MenuButton!
    @IBOutlet weak var Menu: MaterialView!
    @IBOutlet weak var Fury: UIImageView!
    

    @IBAction func PlayGamePressed() {
        Menu.hidden = true
        let scene = GameScene(size: view.bounds.size)
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)

        //view.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        //_ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("checkAlive"), userInfo: nil, repeats: true)
    }


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = MenuScene(size: view.bounds.size)
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)
        
        
        //add images to the array
        let imagesListArray: [UIImage] = [UIImage(named: "Eagle0.png")!, UIImage(named: "Eagle1.png")!, UIImage(named: "Eagle2.png")!, UIImage(named: "Eagle3.png")!, UIImage(named: "Eagle2.png")!, UIImage(named: "Eagle1.png")!]
        
        
        Fury.animationImages = imagesListArray;
        Fury.animationDuration = 0.5
        Fury.startAnimating()
        
        Fury.center.x -= view.bounds.width
        

        let destinationX: CGFloat = self.view.bounds.width / 2 // Your destination X
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut , animations: {
            self.Fury.center.x = destinationX
            }, completion: { finished in
            if (finished) {
                self.hover()
            }
        })
        
       

    }
    

    
    override func shouldAutorotate() -> Bool {
        return true
    }

    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func hover() {
        
        let xPosition = Fury.frame.origin.x
        let yPosition = Fury.frame.origin.y - 45
        let height = Fury.frame.size.height
        let width = Fury.frame.size.width
        
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: [.Repeat, .Autoreverse, .CurveEaseInOut], animations: {
            self.Fury.frame = CGRectMake(xPosition, yPosition, height, width)
            }, completion: { finished in
                if (finished) {
                   // self.drop()
                }
            })
    }
    
//    func checkAlive() {
//        if (!ALIVE) {
//            
//        }
//    }

}
    