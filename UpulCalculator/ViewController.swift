//
//  ViewController.swift
//  UpulCalculator
//
//  Created by Upul Jayalath on 1/04/2015.
//  Copyright (c) 2015 Mine Inc. All rights reserved.
//

//this app is set with constraints with low priorities to cater portrait and landscape, generally for any device

import UIKit

class ViewController: UIViewController {
    
    var operation: String?                              //operations can be +, -, x and division
    var previousValue : Double = 0                      //previous value is kept for above operation to have a first value
    var equalTapped = "no"                              //i am checking the state of = button whether it is tapped, this is 
                                                        //because if i tapped more than 1 time, i need to get its status
    var firstValue = 0.0                                //first value
    var secondValue = 0.0                               //second value
    var initflag = "yes"                                //keep the status of start
    
    //clear button action is defined and most varibales are set to default values
    @IBAction func clear(sender: UISwipeGestureRecognizer) {
        self.operation = nil
        self.previousValue = 0
        self.displayLabel!.text = "0"                   // 0 is displayed
        self.initflag = "yes"
    }
    
    //displayLabel is to display the typed values and the result
    @IBOutlet weak var displayLabel: UILabel!

    //the follwing class describes what happens when the numberButton is tapped
    @IBAction func numberButtonTapped(sender: UIButton) {
        
        //numberText gets the number when it tapps
        let numberText = sender.titleForState(.Normal)
        //initial state is defined by initflag with 2 state yes or no
        initflag = "no"
        
        //assigning the tapped value when the displaylabel is showing 0, ie at start also Error, ie previous calculation is zero by zero and inf when any value is divided by zero
        if (self.displayLabel!.text == "0") || self.displayLabel!.text == "Error" || self.displayLabel.text == "inf" {
            self.displayLabel!.text = numberText
        }
        //below is to avoid inputting continuous or more than one dots
        else if (numberText == "."){
            let input = self.displayLabel?.text!
            var hasDot = false
            
            for ch in input!.unicodeScalars{
                    if ch == "."{
                        hasDot = true
                    }
                
            }
                    if hasDot == false{
                        self.displayLabel!.text! = "\(self.displayLabel!.text!)\(numberText!)"
                    }
        }
        else{
            self.displayLabel!.text! = "\(self.displayLabel!.text!)\(numberText!)"
        }
    }
    
   //the follwing class describes what happens when the operation button is tapped
    @IBAction func operationButtonTapped(sender: UIButton) {
        let operationText = sender.titleForState(.Normal)!
        let numberText = self.displayLabel!.text! as NSString
        
        self.operation = operationText
        self.previousValue = numberText.doubleValue
        //checking the addition
        if self.operation == "+" {
        self.displayLabel.text = self.operation
        }else {
        self.displayLabel.text = "0"
        }
        equalTapped = "yes"
        
        //managing inversion
        if self.operation == "-" && initflag == "yes" {
            self.displayLabel.text = "-"
        }
    }
    
    //the follwing class describes what happens when = button tapped
    @IBAction func equalsButtonTapped(sender: UIButton) {
        initflag == "no"
        if equalTapped == "yes" {
        firstValue = self.previousValue
        secondValue = (self.displayLabel!.text! as NSString).doubleValue //assign the result as second value for next operation
        }
        else{
            firstValue = (self.displayLabel!.text! as NSString).doubleValue
        }
        var result: String = "0.0"
        if (self.operation == "+"){
            //addition
            result = "\(firstValue + secondValue)"
            if result.substringFromIndex(result.endIndex.predecessor().predecessor()) == ".0"{
                self.displayLabel!.text = result.substringToIndex(result.endIndex.predecessor().predecessor())
            } else{
                self.displayLabel!.text = result
            }
        } else if (self.operation == "-"){
            //substraction
            result = "\(firstValue - secondValue)"
            //println(result)
            if result.substringFromIndex(result.endIndex.predecessor().predecessor()) == ".0"{
                self.displayLabel!.text = result.substringToIndex(result.endIndex.predecessor().predecessor())
            } else{
                self.displayLabel!.text = result
            }
        } else if (self.operation == "x"){
            //multiplication
            self.displayLabel!.text = "\(firstValue * secondValue)"
        } else if (self.operation == "÷"){
            //division
            if (firstValue == 0 && secondValue == 0){
                self.displayLabel!.text = "Error"
            } else {
                self.displayLabel!.text = "\(firstValue / secondValue)"
            }
        }
        equalTapped = "no"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initflag = "yes"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

