//
//  ViewController.swift
//  Calcuplate
//
//  Created by Reed Rosser on 11/11/15.
//  Copyright © 2015 Ottr. All rights reserved.
//

import UIKit

var carryOverWeight:String = ""

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputText: UITextField!
    
    @IBOutlet weak var twoPointFive: UILabel!
    
    @IBOutlet var five: UILabel!
    
    @IBOutlet var ten: UILabel!
    
    @IBOutlet var twentyFive: UILabel!
    
    @IBOutlet var fortyFive: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func calculate(sender: AnyObject) {
        
        createPlates()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        createPlates()
        
        inputText.resignFirstResponder()
        
        return true
        
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        inputText.text = ""
        return true
        
    }
    
    
    
    func createPlates() {
        
        resultLabel.text = ""
        
        var amountArray = ["45's: ", "25's: ", "10's: ", "5's: ", "2.5's: "]
        
        let num = Int(inputText.text!)
        
        if num == nil {
            
            descriptionLabel.text = "Brah, that's not a number."
            
        } else if inputText.text == "" {
            
            descriptionLabel.text = "Brah, enter a weight."
            
        } else if Int(inputText.text!)! < 45 {
            
            descriptionLabel.text = "Brah, GREATER than 45 lbs."
            
        } else if Int(inputText.text!)! % 5 != 0 {
            
            descriptionLabel.text = "Brah, increments of 5 only."
            
        } else {
            descriptionLabel.text = "- Add the quantities below to each side of the bar -"
            var weightArray = [90, 50, 20, 10, 5]
            
            carryOverWeight = inputText.text!
            
            var weight = Int(inputText.text!)!
            
            //subtract the bar
            weight -= 45
            for (index, value) in weightArray.enumerate(){
                
                let num = weight / value
                
                weight = (weight) % value
                
                weightArray[index] = num
            }
            for var i = 0; i < 5; i++ {
                
                resultLabel.text = resultLabel.text! + amountArray[i] + String(Int(weightArray[i]))
                if i != 4 {
                    
                    resultLabel.text = resultLabel.text! + "  ~  "
                    
                }
                
            }
            inputText.resignFirstResponder()
            
        }
        
    }

}

