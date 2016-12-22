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

let bookmarksArray = ["malala.jpeg", "michelle.jpg", "hilary.jpg", "varantha-bee.jpg", "oprah.jpg"]

private let reuseIdentifier = "bookmarkCell"

fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

fileprivate let itemsPerRow: CGFloat = 3

var savedBookmarks = [NSManagedObject]()



    // SETTING UP COLLECTION VIEW

        class BookmarksViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

        override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false

        collectionView?.register(BookmarkPhotoCell.self, forCellWithReuseIdentifier: "bookmarkCell")
        
        collectionView?.delegate = self
        
    }
    
    //HIGHLIGHT FUNCTION // NOTE THIS DOESNT WORK
    
    func highlightCell(indexPath : NSIndexPath, flag: Bool) {
                
    let cell = collectionView?.cellForItem(at: indexPath as IndexPath)
                
    if flag {
                cell?.contentView.layer.borderWidth = 3
                cell?.contentView.layer.borderColor = UIColor.black.cgColor

                } else {
                    cell?.contentView.layer.borderWidth = 0
                }
            }
        
            func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            highlightCell(indexPath: indexPath, flag: true)
        }
    
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        highlightCell(indexPath: indexPath, flag: false)
    }

    

    
    
    // PASS DATA ON TO DETAIL VIEW CONTROLLER
    
    /*
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // retrieve selected cell &amp; fruit
        if let indexPath = getIndexPathForSelectedCell() {
            
            let imageInfoToPass = dataSource.fruitsInGroup(indexPath.section)[indexPath.row]
            
            let DetailVC = segue.destination as! CollectionDetailViewController
            DetailVC.fruit = fruit
        }
    }
    
    func getIndexPathForSelectedCell() -> NSIndexPath? {
    
        var indexPath:NSIndexPath?
        
        if collectionView?.indexPathsForSelectedItems.count -&gt 0 {
            indexPath = collectionView?.indexPathsForSelectedItems[0] as? NSIndexPath
    }
    return indexPath
    }

     */
    
    // OTHER OVERRIDE FUNCS
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return savedBookmarks.count
    }

    
    // CONFIGURE THE COLLECTION VIEW BASICS, EG THE CELL
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BookmarkPhotoCell
        
        // Configure the cell
        cell.backgroundColor = UIColor.black
        
        
    // Pull the data from core data
        
        let quoteSelect = QuoteDataSet()

        let bookmarks = savedBookmarks[indexPath.row]
        let quotePulls = bookmarks.value(forKey: "pics") as? String!
        let imagePulls = quoteSelect.quoteImageValues[quotePulls!]
        
        cell.imageView.image = UIImage(named: imagePulls!)
        

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
    

    

    


}
