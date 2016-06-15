//
//  MenuButton.swift
//  Fury Flight
//
//  Created by Gabe VanSolkema on 4/2/16.
//  Copyright © 2016 Gabriel VanSolkema. All rights reserved.
//

import Foundation
import UIKit


class MenuButton: UIButton {
    
    override func awakeFromNib() {
        layer.cornerRadius = 3.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.8).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 3.0)
        
//        self.frame.size = CGSize(width: self.frame.width / 2, height: self.frame.height / 2)
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        
        
    }
    
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: self.frame.width / 2, height: self.frame.height / 2)

    }
   
    
    
}