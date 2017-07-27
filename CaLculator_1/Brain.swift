    //
    //  Brain.swift
    //  CaLculator_1
    //
    //  Created by Andriy_Moravskyi on 6/29/17.
    //  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
    //
    
    import Foundation
    
    let  pi = round(Double.pi * pow(10, 10)) / pow(10, 10)
    
    class Brain: Model {
        static let shared = Brain()
        let output = OutputAdapter.shared
        var equation: String!
        func enterEquation(equation: String) {
            self.equation = equation
            output.presentResult(result: equation)
        }
        // function wich get result from parser and give it to output adapter
        func caculation(calculation: (String)->()){
            let result = change(input: equation)
            let parser = Infixparser()
            output.presentResult(result: String(parser.solve(expression: result).clean))
        }
    }
    
    class Stack {
        
        var selfvalue: [String] = []
        var peek: String {
            get {
                if selfvalue.count != 0 {
                    return selfvalue[selfvalue.count-1]
                }
                else {
                    return ""
                }
            }
        }
        var empty: Bool {
            get {
                return selfvalue.count == 0
            }
        }
        func push(value: String) {
            selfvalue.append(value)
        }
        func pop() -> String {
            var temp = String()
            if selfvalue.count != 0 {
                temp = selfvalue[selfvalue.count-1]
                selfvalue.remove(at: selfvalue.count-1)
            }
            else if selfvalue.count == 0 {
                temp = ""
            }
            return temp
        }
        
        func popwithoutreturn(){
            if selfvalue.count != 0 {
                selfvalue.remove(at: selfvalue.count-1)
            }
        }

    }
    // class wich parse our expression and return result of calculaions
    class Infixparser {
        
        func solve( expression: String) -> Double {
            let expression = expression
            let opertionStack = Stack()
            let numbersStack = Stack()
            let tokens = expression.components(separatedBy: " ")
            
            for (_, token) in tokens.enumerated() {
                if token.isNumber {
                    numbersStack.push(value: token)
                }
                if token.isOperator {
                    if token == ")"{
                        while opertionStack.peek != "(" {
                            if !opertionStack.empty && opertionStack.peek.precedence >= token.precedence {
                                var res = 0.0
                                res = simpleCalculation(operationsymbol: opertionStack, operands: numbersStack)
                                numbersStack.push(value: "\(res)")
                            }
                             opertionStack.popwithoutreturn()
                        }
                         opertionStack.popwithoutreturn()
                    }
                    else if token != "(" && token != ")" && opertionStack.peek != "(" {
                        while !opertionStack.empty && opertionStack.peek != "(" && opertionStack.peek.precedence <= token.precedence  {
                            var res = 0.0
                            res = simpleCalculation(operationsymbol: opertionStack, operands: numbersStack)
                             opertionStack.popwithoutreturn()
                            
                            numbersStack.push(value: "\(res)")
                        }
                    }
                    opertionStack.push(value: token)
                    if opertionStack.peek == ")"{
                         opertionStack.popwithoutreturn()
                    }
                }
            }
            while !opertionStack.empty {
                var res = 0.0
                res = simpleCalculation(operationsymbol: opertionStack, operands: numbersStack)
                opertionStack.popwithoutreturn()
                numbersStack.push(value: "\(res)")
            }
//            let calc = round(Double(numbersStack.pop())! * pow(10, 14)) / pow(10, 14)
//            if calc == -calc {
//                return 0
//            }
//            else {
//                return calc            }
            return Double(numbersStack.pop())!
        }
        
    }
    // function wich do calculations
    func simpleCalculation (operationsymbol : Stack, operands : Stack)-> Double
    {
        var res = 0.0
        switch operationsymbol.peek {
        case "+":
            res = Double(operands.pop())! + Double(operands.pop())!
        case "-":
            if Double(operands.selfvalue[operands.selfvalue.count-2]) != nil {
                res = Double(operands.selfvalue[operands.selfvalue.count-2])! - Double(operands.pop())!
                _ = operands.pop()}
            else if operands.selfvalue[operands.selfvalue.count-2] == ""  {
                res = -Double(operands.pop())!
                 operands.popwithoutreturn()
            }
            else {
                res = -Double(operands.pop())!
            }
        case "^":
            res = pow (Double(operands.selfvalue[operands.selfvalue.count-2])!, Double(operands.pop())!)
             operands.popwithoutreturn()
        case "×":
            res = Double(operands.pop())! * Double(operands.pop())!
        case "÷":
            res = Double(operands.selfvalue[operands.selfvalue.count-2])! / Double(operands.pop())!
             operands.popwithoutreturn()
        case "√":
            res = sqrt(Double(operands.pop())!)
        case "еxp":
            res = exp(Double(operands.pop())!)
        case "^":
            res = pow (Double(operands.selfvalue[operands.selfvalue.count-2])!, Double(operands.pop())!)
             operands.popwithoutreturn()
        case "sin":
            res = sin(Double(operands.pop())!)
            res = round(res * pow(10, 10)) / pow(10, 10)
            if res == -res {
            res = 0
            }
        case "cos":
            res = cos(Double(operands.pop())!)
        case "tan":
            let temp = Double(operands.pop())!
            if temp != 0 && temp.truncatingRemainder(dividingBy: pi/2) == 0 {
                let k = temp/(pi/2)
                if k.truncatingRemainder(dividingBy: 2) != 0 {
                  res = Double.nan
                }
                else {
                 res = tan(temp)
                }
            }
            else {
                res = tan(temp)
            }
           res = round(res * pow(10, 10)) / pow(10, 10)
        case "ctg":
            let temp = Double(operands.pop())!
            if temp.truncatingRemainder(dividingBy: pi) == 0 {
                res = Double.nan
            }
            else {
                res = round(1/tan(temp) * pow(10, 10)) / pow(10, 10)
            }
        case "!" :
            let temp = Double(operands.pop())!
            let temp2 = Int64(temp)
            if temp2 >= 21 {
                res = Double.infinity
            }
            else{
                if Double(temp2) == temp {
                    res = Double(factorial(n: Int64(temp)))}
                else {
                    res = Double(factorial(n: Int64(temp2))) * pow(Double(temp2+1), (temp - Double(temp2)))
                }
            }
        case "ln" :
            res = log(Double(operands.pop())!)
        case "log" :
            res = log(Double(operands.pop())!)/log(10.0)
        default:
            res = 0
        }
        return res
    }
    // function to calculate factorial
    func factorial(n: Int64) -> Int64 {
        if n == 0{
            return 1
        }
        return n * factorial(n: n-1)
    }
    
    // function that splits input expressinon with spaces
    func change (input : String) -> String {
        var resultString =  input.replacingOccurrences(of: "×", with: " × ")
        var temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "÷", with: " ÷ ")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "^", with: " ^ ")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "cos", with: "cos ")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "sin", with: "sin ")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "tan", with: "tan ")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "ctg", with: "ctg ")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "ln", with: "ln ")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "log", with: "log ")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "π", with: "\(pi)")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "e", with: "\(M_E)")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "еxp", with: "еxp ")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "+", with: " + ")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "√", with: "√ ")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "-", with: " - ")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "(", with: "( ")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: ")", with: " )")
        temporaryString = resultString
        resultString = temporaryString.replacingOccurrences(of: "!", with: " !")
        return resultString
    }
