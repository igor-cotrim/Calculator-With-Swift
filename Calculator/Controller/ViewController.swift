//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calculator = CalculatorLogic()
    private var isFinishedTyping = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Can't convert to Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod)  {
                displayValue = result
            }
            
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numberValue = sender.currentTitle {
            if isFinishedTyping {
                displayLabel.text = numberValue
                isFinishedTyping = false
            } else {
                if numberValue == "." {
                    if displayLabel.text!.contains(".") {
                        return
                    }
                }
                displayLabel.text = displayLabel.text?.appending(numberValue)
            }
        }
    }
}
