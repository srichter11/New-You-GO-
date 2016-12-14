//
//  QuoteControllerOne.swift
//  You Go Girl
//
//  Created by Sophia Richter on 11/12/16.
//  Copyright © 2016 Sophia Richter. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class QuoteControllerOne: UIViewController {
    
    // QUOTE DATA SETUP
    
    let quoteAuthorValues =
        ["\"Never stop believing that fighting for what's right is worth it. It is.\"": "- Hilary Clinton",
         
         "\"When you've worked hard, and done well, and walked through that doorway of opportunity, you do not slam it shut behind you. You reach back.\"": "- Michelle Obama",
         
         "\"No one can make you feel inferior without your consent\"": "- Eleanor Roosevelt",
         
         "\"We realize the importance of our voices only when we are silenced.\"": "- Malala Yousfzai",
         
         "\"Do your thing and don't care if they like it\"": "-Tina Fey"]
    
    let quoteImageValues =
        
        ["\"Never stop believing that fighting for what's right is worth it. It is.\"": "hilary.jpg",
         
         "\"When you've worked hard, and done well, and walked through that doorway of opportunity, you do not slam it shut behind you. You reach back.\"": "michelle.jpg",
         
         "\"No one can make you feel inferior without your consent\"": "EleanorRoosevelt.jpg",
         
         "\"We realize the importance of our voices only when we are silenced.\"": "malala.jpeg",
         
         "\"Do your thing and don't care if they like it\"": "tina-fey.jpeg"]
    
    let buttonValuesArray =
        
        ["\"Never stop believing that fighting for what's right is worth it. It is.\"": "Watch her DNC speech",
         
         "\"When you've worked hard, and done well, and walked through that doorway of opportunity, you do not slam it shut behind you. You reach back.\"": "Volunteer to help girls",
         
         "\"No one can make you feel inferior without your consent\"": "Read more about Eleanor",
         
         "\"We realize the importance of our voices only when we are silenced.\"": "Watch her Daily Show Interview",
         
         "\"Do your thing and don't care if they like it\"": "Read more from Bossypants"]
    
    
    var label: UILabel!
    
    var savedBookmarks = [NSManagedObject]()

    
    func randomQuote () -> String {
    
    //let quoteArray = ["\"No one can make you feel inferior without your consent\"", "\"Never stop believing that fighting for what's right is worth it. It is.\"", "\"When you've worked hard, and done well, and walked through that doorway of opportunity, you do not slam it shut behind you. You reach back.\"", "\"We realize the importance of our voices only when we are silenced.\"", "\"Do your thing and don't care if they like it\""]
               
        let quoteSelect = QuoteDataSet()
        
        let randomQuoteSelection = quoteSelect.quoteArray[Int(arc4random_uniform(UInt32(quoteSelect.quoteArray.count)))]
        
        print(quoteSelect.quoteArray)
        
        return randomQuoteSelection
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // SWIPE SETUP
        
        let recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(QuoteControllerOne.swipeLeft))
        recognizer.direction = .left
        self.view .addGestureRecognizer(recognizer)
        
        
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
        label.text = randomQuote()
        //label.text = quoteArray[Int(arc4random_uniform(UInt32(quoteArray.count)))]
        self.view.addSubview(label)
        
        
        /*
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let verticalSpaceLabel = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: topLayoutGuide, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -80)
        
        let horizontalConstraintLabel = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
        let heightConstraintLabel = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 200)
        
         let widthConstraintLabel = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 5)
        
        
        NSLayoutConstraint.activate([verticalSpaceLabel, horizontalConstraintLabel, heightConstraintLabel, widthConstraintLabel])
        
        */
    

        
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
        authorLabel.text = quoteAuthorValues[label.text!]
        self.view.addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
       let verticalSpace = NSLayoutConstraint(item: authorLabel, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: label, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 7)
        
        let horizontalConstraint = NSLayoutConstraint(item: authorLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: label, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)

        
       NSLayoutConstraint.activate([verticalSpace, horizontalConstraint])

        
      // BUTTON SETUP
        
        let linkButton = UIButton(frame: CGRect(x:0, y:0, width: 700, height: 80))
        linkButton.titleLabel!.font = UIFont(name: "Futura", size: CGFloat(14))
        linkButton.tintColor = UIColor.blue
        linkButton.setTitle(buttonValuesArray[label.text!], for: .normal)
        linkButton.layer.borderColor = UIColor.clear.cgColor
        linkButton.layer.borderWidth = 0.5
        linkButton.layer.cornerRadius = 8
        linkButton.layer.backgroundColor = UIColor.white.withAlphaComponent(0.0).cgColor
        linkButton.setTitleColor(UIColor.gray, for: UIControlState())
        //linkButton.setTitleColor(UIColor.white, for: .normal)
        
        self.view.addSubview(linkButton)
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        
        let verticalSpaceButton = NSLayoutConstraint(item: linkButton, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: authorLabel, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 30)
        
        let horizontalConstraintButton = NSLayoutConstraint(item: linkButton, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: authorLabel, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
        let widthContraints =  NSLayoutConstraint(item: linkButton, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 700)
        let heightContraints = NSLayoutConstraint(item: linkButton, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 30)
        
        NSLayoutConstraint.activate([verticalSpaceButton, horizontalConstraintButton, widthContraints, heightContraints])
        
        //BUTTON ACTION -- NEEDS TO BE FIXED NEW SYNTAX
        
        linkButton.addTarget(self, action: #selector(QuoteControllerOne.clickLinkButton), for: UIControlEvents.touchUpInside)
    
        
        
    // IMAGE SETUP -- needs the dark overlay, needs to be centered, scaled and back
        
        
        
        let imageName = quoteImageValues[label.text!]
        let image = UIImage(named: imageName!)
        let backgroundImage = UIImageView(image: image!)
        view.sendSubview(toBack: backgroundImage)
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.tintColor =  UIColor.black
        backgroundImage.alpha = 0.5
        
        backgroundImage.frame = self.view.bounds
        
        self.view.insertSubview(backgroundImage, at: 0)
        
    
        
    }
    
    // SWIPE SEGUE

    func swipeLeft(recognizer : UISwipeGestureRecognizer) {
    self.performSegue(withIdentifier: "mySegue", sender: self)
    }
    

    func clickLinkButton(sender:UIButton){
        self.performSegue(withIdentifier: "segueToWeb", sender: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // FAVORITE SETUP // NOTE THAT THIS PICKS A NEW RANDOM EVERY TIME. NEED TO FIX
    
    func saveBookmark(_ pics: String) {
        //1
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entity(forEntityName: "Bookmark",
                                                 in:managedContext)
        
        let bookmark = NSManagedObject(entity: entity!,
                                       insertInto: managedContext)
        
        //3
        bookmark.setValue(pics, forKey: "pics")
        
        //4
        do {
            try managedContext.save()
            //5
            savedBookmarks.append(bookmark)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }

    
    @IBAction func heartButton(_ sender: Any) {
        
        func saveFavorite () {
            
            print(label.text!)
            
            var favoriteAdd = ""
            favoriteAdd.append(label.text!)
            print(favoriteAdd)
            // need to pass this data to a core database that the bookmarks array can build on
            saveBookmark(favoriteAdd)
            
        }
        
        saveFavorite ()
    }
    
    
    
}
