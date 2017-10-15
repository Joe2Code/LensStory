//
//  CornerRadiusButton.swift
//  ALensStory
//
//  Created by Joe's Computer on 7/30/17.
//  Copyright © 2017 Joseph Mennemeier. All rights reserved.
//

import UIKit

class CornerRadiusButton: UIButton {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 10
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}