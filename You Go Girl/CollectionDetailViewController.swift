//
//  CollectionDetailViewController.swift
//  You Go Girl
//
//  Created by Sophia Richter on 12/14/16.
//  Copyright © 2016 Sophia Richter. All rights reserved.
//

import UIKit

class CollectionDetailViewController: UIViewController {

   var selectedIndex: Int!


    var label: UILabel!
    var imageName: String! = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        
       // title = String(selectedIndex)

    
        let quoteSelect = QuoteDataSet()



        // QUOTE LABEL SETUP
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        label.center.x = self.view.center.x
        label.center.y = self.view.center.y
        label.textAlignment = NSTextAlignment.center
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        //label.backgroundColor = UIColor(red: 0.014, green: 0.043, blue: 0.051, alpha: 0.7)
        label.font = UIFont(name: "Futura", size: CGFloat(30))
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.text = "\"No one can make you feel inferior without your consent\""
        //label.text = quoteSelect.quoteArray[Int(arc4random_uniform(UInt32(quoteArray.count)))]
        self.view.addSubview(label)
        
        

    
         label.translatesAutoresizingMaskIntoConstraints = false
         
         let verticalSpaceLabel = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: topLayoutGuide, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -80)
         
         let horizontalConstraintLabel = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
         
         let heightConstraintLabel = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 200)
         
         let widthConstraintLabel = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 5)
         
         
         NSLayoutConstraint.activate([verticalSpaceLabel, horizontalConstraintLabel, heightConstraintLabel, widthConstraintLabel])
         

        
        
        
        // AUTHOR LABEL SETUP
        
        let authorLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        //authorLabel.center.x = self.view.center.x
        //authorLabel.center.y = self.view.center.y
        authorLabel.textAlignment = NSTextAlignment.center
        authorLabel.lineBreakMode = .byWordWrapping
        authorLabel.numberOfLines = 1
        authorLabel.adjustsFontSizeToFitWidth = true
        authorLabel.font = UIFont(name: "Futura", size: CGFloat(22))
        authorLabel.textColor = UIColor.white.withAlphaComponent(1)
        authorLabel.text = quoteSelect.quoteAuthorValues[label.text!]
        self.view.addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let verticalSpace = NSLayoutConstraint(item: authorLabel, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: label, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 7)
        
        let horizontalConstraint = NSLayoutConstraint(item: authorLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: label, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
        
        NSLayoutConstraint.activate([verticalSpace, horizontalConstraint])
        
        
        // BUTTON SETUP
        
        let linkButton = UIButton(frame: CGRect(x:0, y:0, width: 700, height: 80))
        linkButton.titleLabel!.font = UIFont(name: "Futura", size: CGFloat(14))
        linkButton.tintColor = UIColor.blue
        linkButton.setTitle(quoteSelect.buttonValuesArray[label.text!], for: .normal)
        linkButton.layer.borderColor = UIColor.clear.cgColor
        linkButton.layer.borderWidth = 0.5
        linkButton.layer.cornerRadius = 8
        linkButton.layer.backgroundColor = UIColor.white.withAlphaComponent(0.0).cgColor
        linkButton.setTitleColor(UIColor.gray, for: UIControlState())
        linkButton.setTitleColor(UIColor.white, for: .normal)
        
        self.view.addSubview(linkButton)
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        
        let verticalSpaceButton = NSLayoutConstraint(item: linkButton, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: authorLabel, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 30)
        
        let horizontalConstraintButton = NSLayoutConstraint(item: linkButton, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: authorLabel, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
        let widthContraints =  NSLayoutConstraint(item: linkButton, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 700)
        let heightContraints = NSLayoutConstraint(item: linkButton, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 30)
        
        NSLayoutConstraint.activate([verticalSpaceButton, horizontalConstraintButton, widthContraints, heightContraints])
        
        //BUTTON ACTION -- NEEDS TO BE FIXED NEW SYNTAX
        
        // linkButton.addTarget(self, action: #selector(QuoteControllerOne.clickLinkButton), for: UIControlEvents.touchUpInside)
        
        
        
        // IMAGE SETUP -- needs the dark overlay, needs to be centered, scaled and back
        
        
        let imageName = quoteSelect.quoteImageValues[label.text!]
        print(imageName!)
        let image = UIImage(named: imageName!)
        let backgroundImage = UIImageView(image: image!)
        view.sendSubview(toBack: backgroundImage)
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.tintColor =  UIColor.black
        backgroundImage.alpha = 0.5
        
        backgroundImage.frame = self.view.bounds
        
        self.view.insertSubview(backgroundImage, at: 0)
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
