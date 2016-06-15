//
//  ScoreBarView.swift
//  Fury Flight
//
//  Created by Gabe VanSolkema on 4/2/16.
//  Copyright © 2016 Gabriel VanSolkema. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


class ScoreBarView: UIView {
    
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    var updating = 0
    var livesLeft = 3
    var score = 0
    var add = false
    
    
    class func instanceFromNib() -> ScoreBarView {
        return UINib(nibName: "Score", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! ScoreBarView
    
    }

    
    
    func updateScore(score: Int) {
        
        ScoreLabel.textColor = UIColor(red: 0/255, green: 255/255, blue: 21/255, alpha: 1.0)
            
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.ScoreLabel.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                self.ScoreLabel.text = "\(score)"
                
                // Fade in
                UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.ScoreLabel.alpha = 1.0
                    }, completion: {
                        (finished: Bool) -> Void in
                        self.ScoreLabel.textColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0)
                })
        })
    }
    
    
    
    func reset() {
        ScoreLabel.text = "0"
        LivesLabel.text = "3"
    }
    
    
    
    func addLife(lives: Int) {
      
        updating += 1
        if (updating > 1) {
            NSLog("\(updating)")
            _ = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("fixLives"), userInfo: nil, repeats: false)
            self.livesLeft = lives
            self.add = true
            return
        }
        
        
        LivesLabel.textColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1.0)
        
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.LivesLabel.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
            
                self.LivesLabel.text = "\(lives)"
                // Fade in
                UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.LivesLabel.alpha = 1.0
                    }, completion: {
                        (finished: Bool) -> Void in
                        self.LivesLabel.textColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0)
                        self.updating -= 1
                        
                })
        })
    }
    
    
    
    func loseLife(lives: Int) {

        updating += 1
        if (updating > 1) {
            NSLog("\(updating)")
            _ = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("fixLives"), userInfo: nil, repeats: false)
            self.livesLeft = lives
            self.add = false
            return
        }
        
        
        LivesLabel.textColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
        
        UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.LivesLabel.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                self.LivesLabel.text = "\(lives)"
                
                // Fade in
                UIView.animateWithDuration(0.25, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.LivesLabel.alpha = 1.0
                    }, completion: {
                        (finished: Bool) -> Void in
                        self.LivesLabel.textColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0)
                        self.updating -= 1
                })
        })
        
    }
    
    
    
    func updateLives(lives: Int) {
        
        LivesLabel.text = "\(lives)"
    }
    
    
    func fixLives() {
        
        updating -= 1
        if (add) {
            self.addLife(livesLeft)
        } else {
            self.loseLife(livesLeft)
        }
        
    }
    
    
    
}