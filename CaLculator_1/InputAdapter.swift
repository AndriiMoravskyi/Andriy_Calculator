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
    var Calculation = false

func enterNum(_ number: Int){
        if input == nil || input == "0" {
            input = String(number)
        } else if input.characters.last == ")" || input.characters.last == "π" || input.characters.last == "e"{
            
            input = input + "×\(number)"
        } else {
            input = input + "\(number)"
        }
    Calculation = false
    brain.enterEquation(equation: input)
    
    }
 

func enterUtility(_ symbol: Operation){
    
        switch symbol {
        
        case .pls :
            dottap = false
            Calculation = true
            if input == nil || input == "" || input == "0"{
                input = ""
            }
            else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷"
                || input.characters.last == "^"  {
                input.characters.removeLast()
                if input == nil || input == "" {
                    input = ""
                }
                else{
                    input = input + ("+")}
            }
            else if input.characters.last == "("{
                break
            }

            else if input.characters.last != "√"  {
                input = input + ("+")
            }
            brain.enterEquation(equation: input)
        
        case .mns :
            dottap = false
            Calculation = true
            if input == nil || input == "" || input == "0"
            {
                input = "-"
            }
        else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷"
            || input.characters.last == "^" {
            input.characters.removeLast()
            input = input + ("-")
            }
        else if input.characters.last != "√"  {
            input = input + ("-")
            }
            brain.enterEquation(equation: input)
        
        case .mul :
            Calculation = true
            dottap = false
            if input == nil || input == "" || input == "0"{
                input = ""
            }
            else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷"
                || input.characters.last == "^"  {
                input.characters.removeLast()
                if input == nil || input == "" {
                    input = ""
                }
                else{
                    input = input + ("×")}
            }
            else if input.characters.last == "("{
                break
            }
                
            else if input.characters.last != "√"  {
                input = input + ("×")
            }
            brain.enterEquation(equation: input)
        
        case .div :
            dottap = false
            Calculation = true
            if input == nil || input == "" || input == "0"{
                input = ""
            }
            else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷"
                || input.characters.last == "^"  {
                input.characters.removeLast()
                if input == nil || input == "" {
                    input = ""
                }
                else{
                    input = input + ("÷")}
            }
            else if input.characters.last == "("{
                break
            }

            else if input.characters.last != "√" {
            input = input + ("÷")
            }
            brain.enterEquation(equation: input)
        
        case .pow :
            dottap = false
            Calculation = true
            if input == nil || input == "" || input == "0"{
                input = ""
            }
            else if  input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷"
                || input.characters.last == "^"  {
                input.characters.removeLast()
                if input == nil || input == "" {
                    input = ""
                }
                else{
                    input = input + ("^")}
            }
            else if input.characters.last == "(" {
                break
            }
                
            else if input.characters.last != "√" {
                input = input + ("^")
            }
            brain.enterEquation(equation: input)
        
        case .sqrt :
            dottap = false
            Calculation = true
            if input == nil || input == "" || input == "0"
            {input = "√"}
            else  if input.characters.last == "√" {
                input = input + ("(√")
                ParenthesesCount = ParenthesesCount + 1
            }
            else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last == "e"
                || input.characters.last == "!"
            {
              input = input + ("×√")
            }
            else if input.characters.last != "." {
            input = input + ("√")
            }
            brain.enterEquation(equation: input)
        
        case .sin :
            dottap = false
            Calculation = true
            if input == nil || input == "" || input == "0"
            {input = "sin("}
            else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last == "e"{
                input = input + ("×sin(")}
            else if input.characters.last != "." {
                input = input + ("sin(")
            }
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
        
        case .cos :
            dottap = false
            Calculation = true
            if input == nil || input == "" || input == "0"
            {input = "cos("}
            else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last == "e"{
            input = input + ("×cos(")
            }
            else if input.characters.last != "." {
                input = input + ("cos(")
            }
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
        
        case .tan :
            dottap = false
            Calculation = true
            if input == nil || input == "" || input == "0"
            {input = "tan("}
            else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last == "e"{
            input = input + ("×tan(")}
            else if input.characters.last != "." {
                input = input + ("tan(")
            }
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
        
        case .ctg :
            dottap = false
            Calculation = true
            if input == nil || input == "" || input == "0"
            {input = "ctg("}
            else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last! == "e"{
            input = input + ("×ctg(")}
            else if input.characters.last != "." {
                input = input + ("ctg(")
            }
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
       
        case .exp :
            dottap = false
            Calculation = true
            if input == nil || input == "" || input == "0"
            {input = "еxp("}
            else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last! == "e"{
            input = input + ("×exp(")}
            else if input.characters.last != "." {
                input = input + ("еxp(")
            }
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
        
        case .log :
            dottap = false
            Calculation = true
            if input == nil || input == "" || input == "0"
            {input = "ln("}
            else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last! == "e"{
            input = input + ("×ln(")
            }
            else if input.characters.last != "."{
                input = input + ("ln(")
            }
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
        
        case .log10 :
            dottap = false
            Calculation = true
            if input == nil || input == "" || input == "0"
            {input = "log("}
            else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last! == "e"
            {
            input = input + ("×log(")}
            else if input.characters.last != "." {
                input = input + ("log(")
            }
            ParenthesesCount = ParenthesesCount + 1
            brain.enterEquation(equation: input)
        
        case .leftBracket :if input == nil || input == "" || input == "0" {
            input = "("}
        else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last! == "e"
            || input.characters.last! == "!"{
         input = input + ("×(")        }
        else{
            input = input + ("(")}
            brain.enterEquation(equation: input)
            ParenthesesCount = ParenthesesCount + 1
        
        case .rightBracket :
        if input == nil || input == "" || input == "0"{
                input = "0"
        }
        else if input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷"
            || input.characters.last == "^"{
           break
                     }
        else if input.characters.last != "("{
            input = input + (")")
            ParenthesesCount = ParenthesesCount - 1
        }
        brain.enterEquation(equation: input)
   
        case .pi :
            Calculation = false
            if input == nil || input == "" || input == "0" {
                input = "π"
            }
            else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last == "e"
                || input.characters.last == ")" {
                input = input + ("×π")
            }
            else if input.characters.last != "."{
                input = input + ("π")
            }
            dottap = true
            brain.enterEquation(equation: input)
        
        case .e :
            Calculation = false
            if input == nil || input == "" || input == "0"
            {input = "e"}
            else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last! == "e"
                || input.characters.last! == ")" {
            input = input + ("×e")
            }
            else if input.characters.last != "."{
                input = input + ("e")
            }
            dottap = true
            brain.enterEquation(equation: input)
   
        case .dot :
           validateDot()
           brain.enterEquation(equation: input)
        
        case .equal :
            if input == nil || input == "" || input == "0" || Calculation
            {
                break
            }
            else if ParenthesesCount == 0 && !Calculation {
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
            else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last == "e" {
                input = input + ("!")
            }
            brain.enterEquation(equation: input)
        
        case.clear :
            input = ""
            brain.enterEquation(equation: "0")
        
        case.clearS :
            if input.characters.count >= 1 {
                if input.characters.last == "(" {
                        ParenthesesCount = ParenthesesCount - 1
                        input.characters.removeLast()
                        if let last = input.characters.last{
                            switch last{
                            case "n":
                            let index = input.index(input.startIndex,offsetBy:input.characters.count - 2);
                            if input[index] == "l"{
                                input = input.substring(to: index)
                            }
                            else{
                                input = input.substring(to: index)
                                input.characters.removeLast()
                            }
                            case "s":
                            let index = input.index(input.startIndex,offsetBy:input.characters.count - 3)
                            input = input.substring(to: index)
                            case "g":
                            let index = input.index(input.startIndex,offsetBy:input.characters.count - 3)
                            input = input.substring(to: index)
                            case "p":
                            let index = input.index(input.startIndex,offsetBy:input.characters.count - 3)
                            input = input.substring(to: index)
                        default :
                            break
                            }
                        }
                     }
                     else if input.characters.last == ")" {
                            ParenthesesCount = ParenthesesCount + 1
                            input.characters.removeLast()
                            brain.enterEquation(equation: input)
                        }
    
                    else if input.characters.last != ")" || input.characters.last != "(" {
                            input.characters.removeLast()
                            brain.enterEquation(equation: input)
                        }
                
            
                brain.enterEquation(equation: input)
                
            }
            
       
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
