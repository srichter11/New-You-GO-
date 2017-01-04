//
//  GoalViewController2.swift
//  You Go Girl
//
//  Created by Sophia Richter on 12/21/16.
//  Copyright © 2016 Sophia Richter. All rights reserved.
//

import UIKit

class GoalViewController2: UIViewController {

    @IBOutlet weak var TimelineTableView: UITableView!
    
    @IBOutlet weak var CategoriesTableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // MECHANISM FOR SHOWING THE RIGHT TABLE VIEW BASED ON SEGMENT SELECTION
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
    
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            TimelineTableView.isHidden = true
            CategoriesTableView.isHidden = false
            break;
        case 1:
            TimelineTableView.isHidden = false
            CategoriesTableView.isHidden = true
            break;
        default:
            break;
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
