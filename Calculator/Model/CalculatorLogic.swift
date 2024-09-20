//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Igor Cotrim on 20/09/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (number1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return -n
            case "%":
                return n / 100
            case "AC":
                return 0
            case "=":
                return performTwoNumCalculation(number2: n)
            default:
                intermediateCalculation = (number1: n, calcMethod: symbol)
            }
        }
        
        return nil
    }
    
    private func performTwoNumCalculation(number2: Double) -> Double? {
        if let (number1, calcMethod) = intermediateCalculation {
            switch calcMethod {
            case "+":
                return number1 + number2
            case "-":
                return number1 - number2
            case "×":
                return number1 * number2
            case "÷":
                return number1 / number2
            default:
                fatalError("Unknown calculation method: \(calcMethod)")
            }
        }
        
        return nil
    }
}
