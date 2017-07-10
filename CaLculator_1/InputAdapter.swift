//
//  InputAdapter.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 6/29/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import Foundation

/*class IntputAdapter: InputProtocol {
    static let shared = IntputAdapter()
    
    let brain = Brain.shared
    
    func input(value: Int) {
        // Conversion if needed
        brain.input(number: value)
    }
    
    func input(operation: Operation) {
        brain.input(operation: operation)
    }
}
*/
 class IntputAdapter: InputProtocol
 {
 static let shared = IntputAdapter()
 let brain = Brain.shared
 var input:String!
 
func enterNum(_ number: Int){
        if input == nil || input == "0" {
            input = String(number)
        } else{ input = input + "\(number)"}
 
       brain.enterEquation(equation: input)
    
    }
 

func enterUtility(_ symbol: Int){
    
        switch symbol {
        case Operation.pls.rawValue : input = input + ("+")
            brain.enterEquation(equation: input)
        case Operation.mns.rawValue : input = input + ("-")
            brain.enterEquation(equation: input)
        case Operation.mul.rawValue : input = input + ("×")
            brain.enterEquation(equation: input)
        case Operation.div.rawValue : input = input + ("÷")
            brain.enterEquation(equation: input)
        case Operation.pow.rawValue : input = input + ("^")
            brain.enterEquation(equation: input)
        case Operation.sqrt.rawValue : input = input + ("√")
            brain.enterEquation(equation: input)
        case Operation.sin.rawValue : input = input + ("sin")
            brain.enterEquation(equation: input)
        case Operation.cos.rawValue : input = input + ("cos")
            brain.enterEquation(equation: input)
        case Operation.log.rawValue : input = input + ("log")
            brain.enterEquation(equation: input)
        case Operation.leftBracket.rawValue : input = input + ("(")
            brain.enterEquation(equation: input)
        case Operation.rightBracket.rawValue :input = input + (")")
            brain.enterEquation(equation: input)
        //case Operation.pi.rawValue : brain.inputPi()
        case Operation.equal.rawValue : input = ""
        brain.Caculation(calculation: {result in input = result})        //case Operation.dot.rawValue : brain.inputDot()
        default : break
       
        }
    }
}
