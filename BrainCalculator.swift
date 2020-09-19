//
//  BrainCalculator.swift
//  Calculator
//
//  Created by Firas Alkahlout on 2/16/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

class BrainCalculator {
    
    typealias Element = (number: Double , operation: Character)
    private var elements: [Element] = []
    
    func Add(number : Double , operation : Character) {
        elements.append(Element(number: number, operation: operation))
    }
    
    func Result() -> String {
        CalculateMulAndDiv()
        CalculateMinus()
        return String(elements.reduce(0, {$0 + $1.number}))
    }
    
    func Resart() {
        elements = []
    }
    
    private func CalculateMulAndDiv() {
        for (index , current) in elements.enumerated() {
            if current.operation == "x" || current.operation == "/" {
                let afterCurrent = elements[index + 1]
                var newCalc : Element!
                if current.operation == "x" {
                    newCalc = Element(number: current.number * afterCurrent.number, operation: afterCurrent.operation)
                }else if current.operation == "/" {
                    newCalc = Element(number: current.number / afterCurrent.number, operation: afterCurrent.operation)
                }
                elements.remove(at: index) ; elements.remove(at: index)
                elements.insert(newCalc, at: index)
                CalculateMulAndDiv()
                break
            }
        }
    }
    
    private func CalculateMinus() {
        for (index , current) in elements.enumerated() {
            if current.operation == "-" {
                let afterCurrent = elements[index + 1]
                let newCalc = Element(number: current.number - afterCurrent.number, operation: "+")
                elements.remove(at: index) ; elements.remove(at: index)
                elements.insert(newCalc, at: index)
                CalculateMinus()
                break
            }
        }
    }
}
