//
//  ReplayMenuView.swift
//  Fury Flight
//
//  Created by Gabe VanSolkema on 4/2/16.
//  Copyright © 2016 Gabriel VanSolkema. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


class ReplayMenuView: UIView {
    
    @IBOutlet weak var Menu: MaterialView!
    @IBOutlet weak var ReplayGameButton: MenuButton!
    @IBOutlet weak var HighScoresGameButton: MenuButton!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    class func instanceFromNib() -> ReplayMenuView {
        return UINib(nibName: "ReplayMenu", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! ReplayMenuView
        
    }
    
    
    @IBAction func NewGame(sender: AnyObject) {
        REPLAY = true
        NSLog("Button pressed")
    }
    
    func updateScore(score: Int) {
        ScoreLabel.text = "Score: \(score)"
        //ScoreLabel.
    }
 
    
}
