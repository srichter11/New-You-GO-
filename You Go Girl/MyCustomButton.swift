//
//  MyCustomButton.swift
//  You Go Girl
//
//  Created by Sophia Richter on 11/12/16.
//  Copyright © 2016 Sophia Richter. All rights reserved.
//

import Foundation

import UIKit

class MyCustomButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        self.layer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
        self.setTitleColor(UIColor.gray, for: UIControlState())

    }
}
