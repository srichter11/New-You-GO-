//
//  CollectionViewController.swift
//  You Go Girl
//
//  Created by Sophia Richter on 12/11/16.
//  Copyright © 2016 Sophia Richter. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var imageOne: UIImageView!
    
    @IBOutlet weak var imageFour: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    
    // IMAGE ARRAY
        
        let imageArray = ["hilary.jpg", "EleanorRoosevelt.jpg", "michelle.jpg", "clinton.jpg"]
        
        
    //IMAGE SETUP
        imageOne.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
        
        imageFour.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
    
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 
    


    
}
