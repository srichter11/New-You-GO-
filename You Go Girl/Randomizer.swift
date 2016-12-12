//
//  Randomizer.swift
//  You Go Girl
//
//  Created by Sophia Richter on 11/13/16.
//  Copyright © 2016 Sophia Richter. All rights reserved.
//

import Foundation
import UIKit


class Randomizer: UIViewController {

    @IBOutlet weak var quoteTestLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
                changeQuote()
            }
        
            func changeQuote() {
        
                let quoteArray = ["Quote 000", "Quote 001", "Quote 002", "Quote 003", "Quote 004", "Quote 005", "Quote 006"]
                self.quoteTestLabel.text = quoteArray[Int(arc4random_uniform(UInt32(quoteArray.count)))]
    
    }

}
