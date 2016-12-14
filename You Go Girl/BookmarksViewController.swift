//
//  BookmarksViewController.swift
//  You Go Girl
//
//  Created by Sophia Richter on 12/12/16.
//  Copyright © 2016 Sophia Richter. All rights reserved.
//

import UIKit
import CoreData

// CONSTANTS

let bookmarksArray = ["malala.jpeg", "michelle.jpg", "hilary.jpg", "samantha-bee.jpg", "oprah.jpg"]

private let reuseIdentifier = "bookmarkCell"

fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

fileprivate let itemsPerRow: CGFloat = 3

var savedBookmarks = [NSManagedObject]()


// SETTING UP COLLECTION VIEW

class BookmarksViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        collectionView?.register(BookmarkPhotoCell.self, forCellWithReuseIdentifier: "bookmarkCell")
        
        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return savedBookmarks.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BookmarkPhotoCell
        
       // let bookmarkPhoto = photoForIndexPath(indexPath)
    
        // Configure the cell
        cell.backgroundColor = UIColor.black
        
        
        // THIS IS THE PROBLEM AREA -- CAN"T GET TO WORK
               
       //cell.textLabel.text = "Text"
       
        let quoteSelect = QuoteDataSet()

        let bookmarks = savedBookmarks[indexPath.row]
        let quotePulls = bookmarks.value(forKey: "pics") as? String!
        let imagePulls = quoteSelect.quoteImageValues[quotePulls!]
        
        cell.imageView.image = UIImage(named: imagePulls!)
        
        
        // cell.imageView.image = UIImage(named: (bookmarks.value(forKey: "pics") as? String)!)

        
        //cell.imageView.image = UIImage(named: bookmarksArray[indexPath.row])
        
        
        return cell
    }

    //FLOW LAYOUT

        //1
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            //2
            let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
            let availableWidth = view.frame.width - paddingSpace
            let widthPerItem = availableWidth / itemsPerRow
            
            return CGSize(width: widthPerItem, height: widthPerItem)
        }
        
        //3
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInsets
        }
        
        // 4
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return sectionInsets.left
        }
    
   
    // SELECTION
   
    
    // FETCH FROM THE CORE DATABASE
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
            UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Bookmark")
        
        //3
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            savedBookmarks = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    
    
    
    
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
