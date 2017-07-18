//
//  InputAdapter.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 6/29/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import Foundation

 class InputAdapter: InputProtocol
 {
 static let shared = InputAdapter()
 let brain = Brain.shared
let output = OutputAdapter.shared
 var input:String!
 var dottap = false
 var ParenthesesCount = 0
 
func enterNum(_ number: Int){
        if input == nil || input == "0" {
            input = String(number)
        } else{ input = input + "\(number)"}
 
       brain.enterEquation(equation: input)
    
    }
 

func enterUtility(_ symbol: Operation){
    
        switch symbol {
        case .pls :
            dottap = false
            if input == nil || input == "" || input == "0"
            {input = "0"}
            else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷" || input.characters.last == "^"
            || input.characters.last == "^" {
                input.characters.removeLast()
                input = input + ("+")
            }
            else {
                input = input + ("+")
            }
            brain.enterEquation(equation: input)
        case .mns :
            dottap = false
            if input == nil || input == "" || input == "0"
            {
                input = "-"
            }
        else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷" || input.characters.last == "^"
            || input.characters.last == "^"{
            input.characters.removeLast()
            input = input + ("-")
        }
        else {
        input = input + ("-")
        }
            brain.enterEquation(equation: input)
        case .mul :
            dottap = false
            if input == nil || input == "" || input == "0"
            {input = "0"}
            else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷" || input.characters.last == "^"
            || input.characters.last == "!" {
                input.characters.removeLast()
                input = input + ("×")
            }
            else{
                input = input + ("×")
            }
            brain.enterEquation(equation: input)
        case .div :
            dottap = false
            if input == nil || input == "" || input == "0"
            {input = "0"}
            else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷" || input.characters.last == "^"
            || input.characters.last == "!"  {
                input.characters.removeLast()
                input = input + ("÷")
            }

            else{
            input = input + ("÷")}
            brain.enterEquation(equation: input)
        case .pow :
        if input == nil || input == "" || input == "0"
        {input = "0"}
        else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷" || input.characters.last == "^"
        || input.characters.last == "!"   {
            input.characters.removeLast()
            input = input + ("^")
        }
        else{input = input + ("^")}
        brain.enterEquation(equation: input)

        brain.enterEquation(equation: input)
            brain.enterEquation(equation: input)
        case .sqrt :
            if input == nil || input == "" || input == "0"
            {input = "√"}
            else  if input.characters.last == "√" {
                input = input + ("(√")
                ParenthesesCount = ParenthesesCount + 1
            }
            else{
            input = input + ("√")
            }
            brain.enterEquation(equation: input)
        case .sin :
            if input == nil || input == "" || input == "0"
            {input = "sin("}
            else {input = input + ("sin(")}
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
        case .cos :
            if input == nil || input == "" || input == "0"
            {input = "cos("}
            else {input = input + ("cos(")}
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
        case .tan :
            if input == nil || input == "" || input == "0"
            {input = "tan("}
            else {input = input + ("tan(")}
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
        case .ctg :
            if input == nil || input == "" || input == "0"
            {input = "ctg("}
            else {input = input + ("ctg(")}
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
       case .exp :
            if input == nil || input == "" || input == "0"
            {input = "еxp("}
            else {input = input + ("еxp(")}
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
        case .log :
            if input == nil || input == "" || input == "0"
            {input = "ln("}
            else {input = input + ("ln(")}
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
        case .log10 :
            if input == nil || input == "" || input == "0"
            {input = "log("}
            else {input = input + ("log(")}
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
        case .leftBracket :if input == nil || input == "" || input == "0"
        {input = "("}
        else{
            input = input + ("(")}
            brain.enterEquation(equation: input)
            ParenthesesCount = ParenthesesCount + 1
        case .rightBracket :
        if input == nil || input == "" || input == "0"{
                input = "0"
        }
        else {
            input = input + (")")
        }
        ParenthesesCount = ParenthesesCount - 1
        brain.enterEquation(equation: input)
        //case .sign:
        case .pi :
            if input == nil || input == "" || input == "0"
            {input = "π"}
            else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last! == "e" || input.characters.last! == ")" {
                input = input + ("×π")
            }
            else {
                input = input + ("π")
            }
            dottap = true
            brain.enterEquation(equation: input)
        case .e :
            if input == nil || input == "" || input == "0"
            {input = "e"}
            else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last! == "e" || input.characters.last! == ")" {
            input = input + ("×e")
            }
            else {
            input = input + ("e")
            }
            dottap = true
            brain.enterEquation(equation: input)
   
        case .dot :
           validateDot()
           brain.enterEquation(equation: input)        //case Operation.pi.rawValue : brain.inputPi()
        case .equal :if input == nil || input == "" || input == "0"
        {input = ""}
        else if ParenthesesCount == 0  {
         input = ""
         brain.Caculation(calculation: {result in input = result})
            }
        else if ParenthesesCount != 0 {
            output.presentResult(result: "Parentheses error")
            ParenthesesCount = 0
            input = ""}
            dottap = false
        case .factor :
            if input == nil || input == "" {
                input = "0"
            }
            else if  input.characters.last == "+" || input.characters.last == "^" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷"
                || input.characters.last == "!"  {
                input.characters.removeLast()
                input = input + ("!")
            }
            else {
                input = input + ("!")
            brain.enterEquation(equation: input)
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
