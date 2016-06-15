//
//  MenuView.swift
//  Fury Flight
//
//  Created by Gabe VanSolkema on 4/2/16.
//  Copyright © 2016 Gabriel VanSolkema. All rights reserved.
//

import Foundation
import UIKit


class MenuView: UIView {
    
    override func awakeFromNib() {
        layer.cornerRadius = 8.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 10.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
//        layer.borderWidth = 1
//        layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).CGColor
    }
    
}
