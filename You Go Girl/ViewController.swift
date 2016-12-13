//
//  ViewController.swift
//  You Go Girl
//
//  Created by Sophia Richter on 11/12/16.
//  Copyright © 2016 Sophia Richter. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    
    // IMAGE OUTLETS
    
    @IBOutlet weak var fogImage: UIImageView!
  
    @IBOutlet weak var ladyFiveImage: UIImageView!
    
    @IBOutlet weak var ladySixImage: UIImageView!
    
    @IBOutlet weak var ladySevenImage: UIImageView!
    
    @IBOutlet weak var ladyEightImage: UIImageView!
    
    @IBOutlet weak var ladyThreeImage: UIImageView!
    
    @IBOutlet weak var ladyFourImage: UIImageView!
    
    @IBOutlet weak var ladyTenImage: UIImageView!
    
    @IBOutlet weak var ladyTwoImage: UIImageView!
    
    @IBOutlet weak var ladyElevenImage: UIImageView!

    @IBOutlet weak var ladyTwelveImage: UIImageView!
    
    @IBOutlet weak var ladyThirteenImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TABLE
        
        listTableView.dataSource=self
        
        //SWIPEFUNCTIONS
        
        let recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeUp))
        recognizer.direction = .up
        self.view .addGestureRecognizer(recognizer)
      
        // IMAGE ARRAY
        
        let imageArray = ["hilary.jpg", "EleanorRoosevelt.jpg", "michelle.jpg", "Elizabeth.jpg", "Maya-Angelou.jpg", "Sheryl.jpg", "oprah.jpg", "malala.jpeg", "Angela-Merkel.jpg", "margaret-thatcher.jpg", "tina-fey.jpeg", "jessica-williams.jpg", "samantha-bee.jpg"]
        
        
        //IMAGE SETUP
        
        fogImage.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
        
        ladyFiveImage.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
        
        ladySixImage.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
        
        ladySevenImage.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
        
        ladyEightImage.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
        
        ladyTenImage.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
        
        ladyThreeImage.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
        
        ladyFourImage.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
        
        ladyTwoImage.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
        
        ladyElevenImage.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
        
        ladyTwelveImage.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
        
        ladyThirteenImage.image = UIImage(named: imageArray[Int(arc4random_uniform(UInt32(imageArray.count)))])
    }
    
        func swipeUp(recognizer : UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "mySegue2", sender: self)
    }
        
       /* let recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes))
        recognizer.direction = .left
        self.view .addGestureRecognizer(recognizer)
        
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if segmentedControl.selectedSegmentIndex == 1 && sender.direction == .left
            
        { self.segmentedControl.selectedSegmentIndex = 0
            segmentedControl.sendActions(for: .valueChanged)
        }
        if segmentedControl.selectedSegmentIndex == 0 && sender.direction == .right
        {
            self.segmentedControl.selectedSegmentIndex = 1
            segmentedControl.sendActions(for: .valueChanged)
            
        }
     */
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var toDos = [NSManagedObject]()
    
    @IBOutlet weak var listTableView: UITableView!

    @IBAction func addItem(_ sender: AnyObject) {
        alert()
    }

// SET UP TABLE VIEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listItem")
        
        let person = toDos[indexPath.row]
        
        cell!.textLabel!.text =
            person.value(forKey: "items") as? String
        return cell!
    }
 
    
// DELETE DATA
    

    
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            // remove the deleted item from the model
            let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
            
            let managedContext = appDelegate.managedObjectContext
            managedContext.delete(toDos[indexPath.row] )
            toDos.remove(at: indexPath.row)
            do {
                try managedContext.save()
            } catch _ {
            }
            
            // remove the deleted item from the `UITableView`
            tableView.deleteRows(at: [indexPath], with: .fade)
        default:
            return
        }
    }
    
    
    
// FETCH FROM THE CORE DATABASE
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
        UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        //3
        do {
            let results =
            try managedContext.fetch(fetchRequest)
            toDos = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

    
// ALERT POPUP TO ADD A NEW ITEM
    
    func alert() {
        let alert = UIAlertController(title:"Add a goal", message: "", preferredStyle: .alert)
        
        alert.addTextField{
            (textfield:UITextField) in
            textfield.placeholder = "What do you want to achieve?"
            
        }
        
        let add = UIAlertAction(title: "Add", style: .default,
            handler: { (action:UIAlertAction) -> Void in
                let textField = alert.textFields!.first
                self.saveName(textField!.text!)
                self.listTableView.reloadData()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addAction(add)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
// SAVE TO THE CORE DATABASE


    
    func saveName(_ items: String) {
        //1
        let appDelegate =
        UIApplication.shared.delegate as! AppDelegate
        
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entity(forEntityName: "Person",
            in:managedContext)
        
        let person = NSManagedObject(entity: entity!,
            insertInto: managedContext)
        
        //3
        person.setValue(items, forKey: "items")
        
        //4
        do {
            try managedContext.save()
            //5
            toDos.append(person)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }


}

