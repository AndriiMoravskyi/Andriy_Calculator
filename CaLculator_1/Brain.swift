    //
    //  Brain.swift
    //  CaLculator_1
    //
    //  Created by Andriy_Moravskyi on 6/29/17.
    //  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
    //
    
    import Foundation
    
    let  Pi = round(Double.pi * pow(10, 10)) / pow(10, 10)
    
    class Brain: Model {
        static let shared = Brain()
        
        let output = OutputAdapter.shared
        
        var equation: String!
        
        func enterEquation(equation: String) {
            self.equation = equation
            output.presentResult(result: equation)
        }
        
        func Caculation(calculation: (String)->()){
            
            let Mod = Change(input: equation)
            
            let parser = infixparser()
            output.presentResult(result: String(parser.solve(expression: Mod).clean))
            
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
        
    }
    
    class infixparser {
        
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
                        
                        while opertionStack.peek != "("
                        {
                            
                            if !opertionStack.empty && opertionStack.peek.precedence >= token.precedence
                            {
                                var res = 0.0
                                res = Simplecalculation(Operationsymbol: opertionStack, Operands: numbersStack)
                                
                                numbersStack.push(value: "\(res)")
                            }
                            _ = opertionStack.pop()
                        }
                        _ = opertionStack.pop()
                    }
                        
                    else if token != "(" && token != ")" && opertionStack.peek != "(" {
                        while !opertionStack.empty && opertionStack.peek != "(" && opertionStack.peek.precedence <= token.precedence  {
                            var res = 0.0
                            res = Simplecalculation(Operationsymbol: opertionStack, Operands: numbersStack)
                            _ = opertionStack.pop()
                            
                            numbersStack.push(value: "\(res)")
                        }
                    }
                    opertionStack.push(value: token)
                    if opertionStack.peek == ")"{
                        _ = opertionStack.pop()
                    }
                }
            }
            while !opertionStack.empty {
                var res = 0.0
                res = Simplecalculation(Operationsymbol: opertionStack, Operands: numbersStack)
                _ = opertionStack.pop()
                numbersStack.push(value: "\(res)")
            }
            
            
            let calc = round(Double(numbersStack.pop())! * pow(10, 10)) / pow(10, 10)
            if calc == -calc {
                return 0
            }
            else {
                return calc            }
        }
        
    }
    
    func Simplecalculation (Operationsymbol : Stack, Operands : Stack)-> Double
    {
        var res = 0.0
        switch Operationsymbol.peek {
        case "+":
            res = Double(Operands.pop())! + Double(Operands.pop())!
        case "-":
            if Double(Operands.selfvalue[Operands.selfvalue.count-2]) != nil {
                res = Double(Operands.selfvalue[Operands.selfvalue.count-2])! - Double(Operands.pop())!
                _ = Operands.pop()}
            else if Operands.selfvalue[Operands.selfvalue.count-2] == ""  {
                res = -Double(Operands.pop())!
                _ = Operands.pop()
            }
            else {
                res = -Double(Operands.pop())!
            }
        case "^":
            res = pow (Double(Operands.selfvalue[Operands.selfvalue.count-2])!, Double(Operands.pop())!)
            _ = Operands.pop()
        case "*":
            res = Double(Operands.pop())! * Double(Operands.pop())!
        case "/":
            res = Double(Operands.selfvalue[Operands.selfvalue.count-2])! / Double(Operands.pop())!
            _ = Operands.pop()
        case "√":
            res = sqrt(Double(Operands.pop())!)
        case "еxp":
            res = exp(Double(Operands.pop())!)
        case "^":
            res = pow (Double(Operands.selfvalue[Operands.selfvalue.count-2])!, Double(Operands.pop())!)
            _ = Operands.pop()
        case "sin":
            res = sin(Double(Operands.pop())!)
        case "cos":
            res = cos(Double(Operands.pop())!)
        case "tan":
            let temp = Double(Operands.pop())!
            if temp != 0 && temp.truncatingRemainder(dividingBy: Pi/2) == 0 {
                let k = temp/(Pi/2)
                if k.truncatingRemainder(dividingBy: 2) != 0 {
                  res = Double.infinity
                }
                else {
                 res = tan(temp)
                }
            }
            else {
                res = tan(temp)}
       
        case "ctg":
            let temp = Double(Operands.pop())!
            if temp.truncatingRemainder(dividingBy: Pi) == 0 {
                res = Double.infinity
            }
            else {
                res = round(1/tan(temp) * pow(10, 10)) / pow(10, 10)
            }
        case "!" :
            let temp = Double(Operands.pop())!
            let temp2 = Int64(temp)
            if temp2 >= 21 {
                res = Double.infinity
            }
            else{
                if Double(temp2) == temp {
                    res = Double(factorial(n: Int64(temp)))}
                else {
                    res = exp(log(Double(factorial(n: Int64(temp2)))) + (temp - Double(temp2)) * log(temp+1))
                }
            }
        case "ln" :
            res = log(Double(Operands.pop())!)
        case "log" :
            res = log(Double(Operands.pop())!)/log(10.0)
        default:
            res = 0
        }
        return res
    }
    
    func factorial(n: Int64) -> Int64 {
        if n == 0{
            return 1
        }
        return n * factorial(n: n-1)
    }
    
    
    func Change (input : String) -> String {
        var Mod =  input.replacingOccurrences(of: "×", with: " * ")
        var Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "÷", with: " / ")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "^", with: " ^ ")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "cos", with: "cos ")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "sin", with: "sin ")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "tan", with: "tan ")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "ctg", with: "ctg ")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "ln", with: "ln ")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "log", with: "log ")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "π", with: "\(Pi)")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "e", with: "\(M_E)")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "еxp", with: "еxp ")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "+", with: " + ")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "√", with: "√ ")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "-", with: " - ")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "(", with: "( ")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: ")", with: " )")
        Mod1 = Mod
        Mod = Mod1.replacingOccurrences(of: "!", with: " !")
        return Mod
    }
