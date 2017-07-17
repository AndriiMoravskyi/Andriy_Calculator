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
 var dottap = false
 
func enterNum(_ number: Int){
        if input == nil || input == "0" {
            input = String(number)
        } else{ input = input + "\(number)"}
 
       brain.enterEquation(equation: input)
    
    }
 

func enterUtility(_ symbol: Operation){
    
        switch symbol {
        case .pls :
            if input == nil || input == "" || input == "0"
            {input = "0"}
            else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷" || input.characters.last == "^"  {
                input.characters.removeLast()
                input = input + ("+")
            }
            else {
                input = input + ("+")
            }
            brain.enterEquation(equation: input)
        case .mns :
            if input == nil || input == "" || input == "0"
            {input = "-"}
        else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷" || input.characters.last == "^" {
            input.characters.removeLast()
            input = input + ("-")
        }
        else {
        input = input + ("-")
        }
            brain.enterEquation(equation: input)
        case .mul :
            if input == nil || input == "" || input == "0"
            {input = "0"}
            else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷" || input.characters.last == "^"{
                input.characters.removeLast()
                input = input + ("×")
            }
                    else{input = input + ("×")}
            brain.enterEquation(equation: input)
        case .div :
            if input == nil || input == "" || input == "0"
            {input = "0"}
            else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷" || input.characters.last == "^"{
                input.characters.removeLast()
                input = input + ("÷")
            }

        else{
            input = input + ("÷")}
            brain.enterEquation(equation: input)
        case .pow :
        if input == nil || input == "" || input == "0"
        {input = "0"}
        else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷" || input.characters.last == "^" {
            input.characters.removeLast()
            input = input + ("^")
        }
        else{input = input + ("^")}
        brain.enterEquation(equation: input)

        brain.enterEquation(equation: input)
            brain.enterEquation(equation: input)
        case .sqrt :
            if input == nil
            {input = "√"}
            else {input = input + ("√")}
            brain.enterEquation(equation: input)
        case .sin :
            if input == nil
            {input = "sin("}
            else {input = input + ("sin(")}
            brain.enterEquation(equation: input)
        case .cos :
            if input == nil || input == "" || input == "0"
            {input = "cos("}
            else {input = input + ("cos(")}
            brain.enterEquation(equation: input)
        case .log : input = input + ("ln(")
            brain.enterEquation(equation: input)
        case .leftBracket :if input == nil || input == "" || input == "0"
        {input = "("}
        else{
            input = input + ("(")}
            brain.enterEquation(equation: input)
        case .rightBracket :input = input + (")")
            brain.enterEquation(equation: input)
        //case .sign:
        case .dot :
           validateDot()
           brain.enterEquation(equation: input)        //case Operation.pi.rawValue : brain.inputPi()
        case .equal :if input == nil || input == "" || input == "0"
        {input = ""}
        else {input = ""
         brain.Caculation(calculation: {result in input = result})
            }
        case.clear :
            input = ""
            brain.enterEquation(equation: "0")
        case.clearS :
            if input.characters.count > 1 {
                input.characters.removeLast()
                brain.enterEquation(equation: input)
            } else{input = ""
            brain.enterEquation(equation: "0")}

        //case Operation.dot.rawValue :
        default : break
       
        }
    }
    func validateDot() {
        if input == nil || input == "0" || input == "" {
            input = "0."
            dottap = true
        } else if input.characters.last != "." && dottap == false {
            if input.characters.last! >= "0" && input.characters.last! <= "9" {
                input! += "."
                dottap = true
            } else if input.characters.last == "(" {
                input = input + "0."
               dottap = true
            }
        }
    }
}
