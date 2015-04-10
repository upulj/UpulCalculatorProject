//
//  CalculatorButtons.swift
//  UpulCalculator
//
//  Created by Upul Jayalath on 9/04/2015.
//  Copyright (c) 2015 Mine Inc. All rights reserved.
//


//This class is used to customise the buttons, especially to have borders
//each button's custom class is changed to Class CalculatosButtons


import UIKit

class CalculatorButons: UIButton {
    //i used required init(coder aDecoder: NSCoder) to customise the buttons
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        //each button's border is set to black with width of 0.5
        
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 0.5
     }
}