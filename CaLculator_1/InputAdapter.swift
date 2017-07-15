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
 class InputAdapter: InputProtocol
 {
 static let shared = InputAdapter()
 let brain = Brain.shared
 var input:String!
 
func enterNum(_ number: Int){
        if input == nil || input == "0" {
            input = String(number)
        } else{ input = input + "\(number)"}
 
       brain.enterEquation(equation: input)
    
    }
 

func enterUtility(_ symbol: Operation){
    
        switch symbol {
        case .pls : input = input + ("+")
            brain.enterEquation(equation: input)
        case .mns : input = input + ("-")
            brain.enterEquation(equation: input)
        case .mul : input = input + ("×")
            brain.enterEquation(equation: input)
        case .div : input = input + ("÷")
            brain.enterEquation(equation: input)
        case .pow : input = input + ("^")
            brain.enterEquation(equation: input)
        case .sqrt : input = input + ("√")
            brain.enterEquation(equation: input)
        case .sin : input = input + ("sin")
            brain.enterEquation(equation: input)
        case .cos :
            if input == nil
            {input = "cos"}
            else {input = input + ("cos")}
            brain.enterEquation(equation: input)
        case .log : input = input + ("log")
            brain.enterEquation(equation: input)
        case .leftBracket : input = input + ("(")
            brain.enterEquation(equation: input)
        case .rightBracket :input = input + (")")
            brain.enterEquation(equation: input)
        //case .sign:
        case .dot :
            if input == nil || input == "0"
        {input = ("0.")
            brain.enterEquation(equation: input)
            }
                else
        {input  = input + "."
            brain.enterEquation(equation: input)}
        //case Operation.pi.rawValue : brain.inputPi()
        case .equal : input = " "
        brain.Caculation(calculation: {result in input = result})
        case.clear :
            input = " "
            brain.enterEquation(equation: "0")
        case.clearS :
            if input.characters.count > 1 {
                input.characters.removeLast()
                brain.enterEquation(equation: input)
            } else{input = " "
            brain.enterEquation(equation: "0")}

        //case Operation.dot.rawValue :
        default : break
       
        }
    }
}
