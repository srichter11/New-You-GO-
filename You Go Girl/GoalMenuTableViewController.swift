//
//  GoalMenuTableViewController.swift
//  You Go Girl
//
//  Created by Sophia Richter on 12/23/16.
//  Copyright © 2016 Sophia Richter. All rights reserved.
//

import UIKit
import CoreData
import Foundation


class GoalMenuTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // @IBAction func addItem(_ sender: AnyObject) {
    //alert()
    
    @IBOutlet var menuTableView: UITableView!
    
    var menuItems = [NSManagedObject]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        
       self.navigationItem.rightBarButtonItem = self.editButtonItem
    
        saveName("Family")
      
    }

    

    // SET UP TABLE VIEW

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItem")
        
        let menu = menuItems[indexPath.row]
        
        cell!.textLabel!.text =
            menu.value(forKey: "items") as? String
        
        cell!.textLabel?.textColor = UIColor.white
        cell!.textLabel?.font = UIFont(name: "Futura", size: CGFloat(24))
        cell!.textLabel?.textAlignment = .center

        cell!.preservesSuperviewLayoutMargins = false
        cell!.separatorInset = UIEdgeInsets.zero
        cell!.layoutMargins = UIEdgeInsets.zero
        
        return cell!
    }
    
    // TABLE VIEW COLORS GRADIENT
    
    /*
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = menuItems.count - 1
        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.9
        return UIColor(red: 0.1, green: val, blue: 0.7, alpha: 1.0)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorForIndex(index: indexPath.row)

    }
 */
 
    // TABLE VIEW COLORS ASSIGNED
    


    let colorArray = [UIColor(red: 129/255, green: 207/255, blue: 224/255, alpha: 1), UIColor(red: 107/255, green: 185/255, blue: 240/255, alpha: 1), UIColor(red: 34/255, green: 167/255, blue: 240/255, alpha: 1), UIColor(red: 65/255, green: 131/255, blue: 215/255, alpha: 1), UIColor(red: 58/255, green: 83/255, blue: 155/255, alpha: 1), UIColor(red: 129/255, green: 207/255, blue: 224/255, alpha: 1), UIColor(red: 107/255, green: 185/255, blue: 240/255, alpha: 1), UIColor(red: 34/255, green: 167/255, blue: 240/255, alpha: 1), UIColor(red: 65/255, green: 131/255, blue: 215/255, alpha: 1), UIColor(red: 58/255, green: 83/255, blue: 155/255, alpha: 1),UIColor(red: 129/255, green: 207/255, blue: 224/255, alpha: 1), UIColor(red: 107/255, green: 185/255, blue: 240/255, alpha: 1), UIColor(red: 34/255, green: 167/255, blue: 240/255, alpha: 1), UIColor(red: 65/255, green: 131/255, blue: 215/255, alpha: 1), UIColor(red: 58/255, green: 83/255, blue: 155/255, alpha: 1),UIColor(red: 129/255, green: 207/255, blue: 224/255, alpha: 1), UIColor(red: 107/255, green: 185/255, blue: 240/255, alpha: 1), UIColor(red: 34/255, green: 167/255, blue: 240/255, alpha: 1), UIColor(red: 65/255, green: 131/255, blue: 215/255, alpha: 1), UIColor(red: 58/255, green: 83/255, blue: 155/255, alpha: 1),UIColor(red: 129/255, green: 207/255, blue: 224/255, alpha: 1), UIColor(red: 107/255, green: 185/255, blue: 240/255, alpha: 1), UIColor(red: 34/255, green: 167/255, blue: 240/255, alpha: 1), UIColor(red: 65/255, green: 131/255, blue: 215/255, alpha: 1), UIColor(red: 58/255, green: 83/255, blue: 155/255, alpha: 1),UIColor(red: 129/255, green: 207/255, blue: 224/255, alpha: 1), UIColor(red: 107/255, green: 185/255, blue: 240/255, alpha: 1), UIColor(red: 34/255, green: 167/255, blue: 240/255, alpha: 1), UIColor(red: 65/255, green: 131/255, blue: 215/255, alpha: 1), UIColor(red: 58/255, green: 83/255, blue: 155/255, alpha: 1),UIColor(red: 129/255, green: 207/255, blue: 224/255, alpha: 1), UIColor(red: 107/255, green: 185/255, blue: 240/255, alpha: 1), UIColor(red: 34/255, green: 167/255, blue: 240/255, alpha: 1), UIColor(red: 65/255, green: 131/255, blue: 215/255, alpha: 1), UIColor(red: 58/255, green: 83/255, blue: 155/255, alpha: 1), ]
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorArray[(index: indexPath.row)]
        
    }
    
    
    
    
    // SEGUE TO NEXT TABLE VIEW
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goalDetailSegue", sender: indexPath.row)
        print("OMG WOW")
    }
    
    
    
    // DELETE DATA
    
    
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            // remove the deleted item from the model
            let appDelegate =
                UIApplication.shared.delegate as! AppDelegate
            
            let managedContext = appDelegate.managedObjectContext
            managedContext.delete(menuItems[indexPath.row] )
            menuItems.remove(at: indexPath.row)
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
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Menu")
        
        //3
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            menuItems = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    // ALERT POPUP TO ADD A NEW ITEM
    
    func alert() {
        let alert = UIAlertController(title:"Add a category", message: "", preferredStyle: .alert)
        
        alert.addTextField{
            (textfield:UITextField) in
            textfield.placeholder = "Name your new category"
            
        }
        
        let add = UIAlertAction(title: "Add", style: .default,
                                handler: { (action:UIAlertAction) -> Void in
                                    let textField = alert.textFields!.first
                                    self.saveName(textField!.text!)
                                    self.menuTableView.reloadData()
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
        let entity =  NSEntityDescription.entity(forEntityName: "Menu",
                                                 in:managedContext)
        
        let menu = NSManagedObject(entity: entity!,
                                     insertInto: managedContext)
        
        //3
        menu.setValue(items, forKey: "items")
        
        //4
        do {
            try managedContext.save()
            //5
            menuItems.append(menu)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
  
    
    /*
    func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "goalDetailSegue") {
            let controller = (segue.destination as! ViewController

        }
    }
    */

}





    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


