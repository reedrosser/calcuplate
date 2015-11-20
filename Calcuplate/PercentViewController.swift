//
//  PercentViewController.swift
//  Calcuplate
//
//  Created by Reed Rosser on 11/13/15.
//  Copyright © 2015 Ottr. All rights reserved.
//

import UIKit

var tableValues = [String]()

class PercentViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {
    
    let percentArray = [0.4, 0.45, 0.5, 0.55, 0.60, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95]

    @IBOutlet var inputText: UITextField!
    
    @IBOutlet var percentageTable: UITableView!
    
    @IBAction func calculatePercent(sender: AnyObject) {
        
       calculate()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableValues.count
        
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = tableValues[indexPath.row]
        
        return cell
        
    }
    
    func roundToFives(x : Double) -> Int {
        return 5 * Int(round(x / 5.0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputText.text = carryOverWeight

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        percentageTable.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        calculate()
        
        inputText.resignFirstResponder()
        
        return true
        
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        inputText.text = ""
        
        tableValues.removeAll()
        
        percentageTable.reloadData()
        
        return true
        
    }
    
    func calculate() {
    
        tableValues.removeAll()
        
        let num = Int(inputText.text!)
        
        if num != nil {
            
            for value in percentArray {
                
                tableValues.append("\(Int(value * 100))% - \(roundToFives(value * Double(num!)))")
                
            }
            
            self.percentageTable.reloadData()
            
        } else {
            
            inputText.text = ""
            
        }
        
        inputText.resignFirstResponder()

    
    }
    

}
