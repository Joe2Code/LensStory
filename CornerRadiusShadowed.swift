//
//  CornerRadiusShadowed.swift
//  ALensStory
//
//  Created by Joe's Computer on 7/30/17.
//  Copyright © 2017 Joseph Mennemeier. All rights reserved.
//

import UIKit

class CornerRadiusShadowed: UIView {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 5
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
