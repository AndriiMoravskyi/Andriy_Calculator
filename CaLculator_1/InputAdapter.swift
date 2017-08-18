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
    var parenthesesCount = 0
    var calculation = false
    //function wich validate enter of number
    func enterNum(_ number: Int){
            if input == nil || input == "0" {
                input = String(number)
            } else if input.characters.last == ")" || input.characters.last == "π" || input.characters.last == "e"{
                
                input = input + "×\(number)"
            } else {
                input = input + "\(number)"
            }
        calculation = false
        brain.enterEquation(equation: input)
        
        }
     
    // function wich validate enter of operaions
    func enterUtility(_ symbol: Operation){
        switch symbol {
            case .pls :
                dottap = false
                calculation = true
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
                else if input.characters.last == "(" || input.characters.last == "√"{
                    break
                }

                else {
                    input = input + ("+")
                }
                brain.enterEquation(equation: input)
            
            case .mns :
                dottap = false
                calculation = true
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
                calculation = true
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
                else if input.characters.last == "(" || input.characters.last == "√" {
                    break
                }
                    
                else   {
                    input = input + ("×")
                }
                brain.enterEquation(equation: input)
            
            case .div :
                dottap = false
                calculation = true
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
                else if input.characters.last == "(" || input.characters.last == "√" {
                    break
                }

                else  {
                input = input + ("÷")
                }
                brain.enterEquation(equation: input)
            
            case .pow :
                dottap = false
                calculation = true
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
                calculation = true
                if input == nil || input == "" || input == "0" {
                    input = "√"
                }
                else  if input.characters.last == "√" {
                    input = input + ("(√")
                    parenthesesCount = parenthesesCount + 1
                }
                else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last == "e"
                    || input.characters.last == "!" || input.characters.last == ")"
                {
                    input = input + ("×√")
                }
                else if input.characters.last != "." {
                input = input + ("√")
                }
                brain.enterEquation(equation: input)
            
            case .sin :
                dottap = false
                calculation = true
                if input == nil || input == "" || input == "0"{
                    input = "sin("
                }
                else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last == "e"
                || input.characters.last == ")" {
                    input = input + ("×sin(")}
                else if input.characters.last != "." {
                    input = input + ("sin(")
                }
                parenthesesCount = parenthesesCount + 1
                brain.enterEquation(equation: input)
            
            case .cos :
                dottap = false
                calculation = true
                if input == nil || input == "" || input == "0"
                {input = "cos("}
                else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last == "e"
                || input.characters.last == ")"  {
                input = input + ("×cos(")
                }
                else if input.characters.last != "." {
                    input = input + ("cos(")
                }
                parenthesesCount = parenthesesCount + 1
                brain.enterEquation(equation: input)
            
            case .tan :
                dottap = false
                calculation = true
                if input == nil || input == "" || input == "0"
                {input = "tan("}
                else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last == "e"
                || input.characters.last == ")" {
                input = input + ("×tan(")}
                else if input.characters.last != "." {
                    input = input + ("tan(")
                }
                parenthesesCount = parenthesesCount + 1
                brain.enterEquation(equation: input)
            
            case .ctg :
                dottap = false
                calculation = true
                if input == nil || input == "" || input == "0"
                {input = "ctg("}
                else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last! == "e"
                || input.characters.last == ")" {
                input = input + ("×ctg(")}
                else if input.characters.last != "." {
                    input = input + ("ctg(")
                }
                parenthesesCount = parenthesesCount + 1
                brain.enterEquation(equation: input)
           
            case .exp :
                dottap = false
                calculation = true
                if input == nil || input == "" || input == "0"
                {input = "еxp("}
                else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last! == "e"
                || input.characters.last == ")" {
                input = input + ("×exp(")}
                else if input.characters.last != "." {
                    input = input + ("еxp(")
                }
                parenthesesCount = parenthesesCount + 1
                brain.enterEquation(equation: input)
            
            case .log :
                dottap = false
                calculation = true
                if input == nil || input == "" || input == "0"
                {input = "ln("}
                else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last! == "e"
                || input.characters.last == ")" {
                input = input + ("×ln(")
                }
                else if input.characters.last != "."{
                    input = input + ("ln(")
                }
                parenthesesCount = parenthesesCount + 1
                brain.enterEquation(equation: input)
            
            case .log10 :
                dottap = false
                calculation = true
                if input == nil || input == "" || input == "0"
                {input = "log("}
                else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last! == "e"
                || input.characters.last == ")" {
                input = input + ("×log(")}
                else if input.characters.last != "." {
                    input = input + ("log(")
                }
                parenthesesCount = parenthesesCount + 1
                brain.enterEquation(equation: input)
            
            case .leftBracket :
                if input == nil || input == "" || input == "0" {
                input = "("}
                else if input.characters.last! >= "0" && input.characters.last! <= "9" || input.characters.last == "π" || input.characters.last! == "e"
                    || input.characters.last! == "!"{
                 input = input + ("×(")
                }
                else{
                    input = input + ("(")
                }
                    brain.enterEquation(equation: input)
                    parenthesesCount = parenthesesCount + 1
                
            case .rightBracket :
                if input == nil || input == "" || input == "0"{
                        input = "0"
                }
                else if input.characters.last == "+" || input.characters.last == "-" || input.characters.last == "×" || input.characters.last == "÷"
                    || input.characters.last == "^" {
                   break
                             }
                else if input.characters.last != "(" {
                    input = input + (")")
                    parenthesesCount = parenthesesCount - 1
                }
                brain.enterEquation(equation: input)
       
            case .pi :
                calculation = false
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
                calculation = false
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
                if input == nil || input == "" || input == "0" || calculation
                {
                    break
                }
                else if parenthesesCount == 0 && !calculation {
                input = ""
                brain.caculation(calculation: {result in input = result})
                }
                else if parenthesesCount != 0 {
                    output.presentResult(result: "Parentheses error")
                    parenthesesCount = 0
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
                if  input == nil || input == "0" || input == "" {
                    break
                }
                else if input.characters.count >= 1 {
                    if input.characters.last == "(" {
                            parenthesesCount = parenthesesCount - 1
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
                                parenthesesCount = parenthesesCount + 1
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
