//
//  scheduleController.swift
//  Calcuplate
//
//  Created by Reed Rosser on 11/17/15.
//  Copyright © 2015 Ottr. All rights reserved.
//

import UIKit

class scheduleController: UIViewController, UITableViewDelegate {
    
    let keys = ["main", "warmup", "workset", "accessory"]
    
    let thursday = ["main": "Bench Press", "warmup": "50x5, 65x5, 80x5", "workset": "90x3, 105x3, 115 x Max Reps", "accessory": "Kroc Row: 5x20"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return thursday.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        let key = keys[indexPath.row]
        
        cell.textLabel?.text = key + ": " + thursday[key]!
        
        return cell
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
