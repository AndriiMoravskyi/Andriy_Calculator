//
//  Brain.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 6/29/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import Foundation

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
        output.presentResult(result: String(parser.solve(expression: Mod)))
        
//          let Mod = Change(input: equation)
//          let parser = infixparser()
//          output.presentResult(result: String(analyzeExpressionWith(input: Mod)))
    }
}


class Stack {
    
    var selfvalue: [String] = []
    var peek: String {
        get {
            if selfvalue.count != 0 {
                return selfvalue[selfvalue.count-1]
            } else {
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
        } else if selfvalue.count == 0 {
            temp = ""
        }
        return temp
    }
    
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
    Mod = Mod1.replacingOccurrences(of: "+", with: " + ")
    Mod1 = Mod
    Mod = Mod1.replacingOccurrences(of: "√", with: "√ ")
    Mod1 = Mod
    Mod = Mod1.replacingOccurrences(of: "-", with: " - ")
    Mod1 = Mod
    Mod = Mod1.replacingOccurrences(of: "(", with: "( ")
    Mod1 = Mod
    Mod = Mod1.replacingOccurrences(of: ")", with: " )")
    return Mod
}

extension String {
    
    var precedence: Int {
        get {
            switch self {
            case "+":
                return 6
            case "-":
                return 5
            case "*":
                return 4
            case "/":
                return 3
            case "^":
                return 2
            case "√":
                return 2
            case "sin":
                return 1
            case "cos":
                return 1
            case "(":
                return 0
            case ")":
                return 0
            default:
                return 100
            }
        }
    }
    
    var isOperator: Bool {
        get {
            return ("+ - * / sin cos ^ √ ( )" as NSString).contains(self)
        }
    }
    
    var isNumber: Bool {
        get {
            return !isOperator && self != "(" && self != ")"
        }
    }
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return self[Range(start ..< end)]
    }
}



extension Array {
    func get(index: Int) -> Element {
        if 0 <= index && index < count {
            return self[index]
        } else {
            return 0 as! Element
        }
    }
}


class infixparser {
    
    
    func solve( expression: String) -> Double {
        
        let expression = expression
        let opertionStack = Stack()
        let numbersStack = Stack()
        let tokens = expression.components(separatedBy: " ")
        
        for (_, token) in tokens.enumerated() {
            
            //"\(token) at \(index)"
            
            if token.isNumber {
                numbersStack.push(value: token)
            }
            
            if token.isOperator {
                if token == "("
                {
                    opertionStack.push(value: "(")
                }
                if token == ")"{
                    
                     while opertionStack.peek != "("
                    {
                        if !opertionStack.empty {
                            var res = 0.0
                            switch opertionStack.peek {
                            case "+":
                                res = Double(numbersStack.pop())! + Double(numbersStack.pop())!
                            case "-":
                                res = Double(numbersStack.selfvalue[numbersStack.selfvalue.count-2])! - Double(numbersStack.pop())!
                                _ = numbersStack.pop()
                            case "^":
                                res = pow (Double(numbersStack.selfvalue[numbersStack.selfvalue.count-2])!, Double(numbersStack.pop())!)
                                _ = numbersStack.pop()
                            case "*":
                                res = Double(numbersStack.pop())! * Double(numbersStack.pop())!
                            case "/":
                                res = Double(numbersStack.selfvalue[numbersStack.selfvalue.count-2])! / Double(numbersStack.pop())!
                                _ = numbersStack.pop()
                            case "√":
                                res = sqrt(Double(numbersStack.pop())!)
                            case "sin":
                                res = sin (Double(numbersStack.pop())!)
                            case "cos":
                                res = cos(Double(numbersStack.pop())!)
                            default:
                                res = 0
                            }
                            
                            _ = opertionStack.pop()
                            numbersStack.push(value: "\(res)")
                        }
                        
                    }
                   _ = opertionStack.pop()
                }
                    
                else if token != "(" && token != ")" {
                    opertionStack.push(value: token)
                    if !opertionStack.empty && opertionStack.peek.precedence < token.precedence {
                        var res = 0.0
                        switch opertionStack.peek {
                        case "+":
                            res = Double(numbersStack.pop())! + Double(numbersStack.pop())!
                        case "-":
                            res = Double(numbersStack.selfvalue[numbersStack.selfvalue.count-2])! - Double(numbersStack.pop())!
                            _ = numbersStack.pop()
                        case "*":
                            res = Double(numbersStack.pop())! * Double(numbersStack.pop())!
                        case "/":
                            res = Double(numbersStack.selfvalue[numbersStack.selfvalue.count-2])! / Double(numbersStack.pop())!
                            _ = numbersStack.pop()
                        case "sin":
                            res = sin(Double(numbersStack.pop())!)
                        case "cos":
                            res = cos(Double(numbersStack.pop())!)
                        case "√":
                            res = sqrt(Double(numbersStack.pop())!)
                        case "^":
                            res = pow (Double(numbersStack.selfvalue[numbersStack.selfvalue.count-2])!, Double(numbersStack.pop())!)
                            _ = numbersStack.pop()
                        default:
                            res = 0
                        }
                        _ = opertionStack.pop()
                        numbersStack.push(value: "\(res)")
                    }
                }
            }
        }
        while !opertionStack.empty {
            var res = 0.0
            switch opertionStack.peek {
            case "+":
                res = Double(numbersStack.pop())! + Double(numbersStack.pop())!
            case "-":
                res = Double(numbersStack.selfvalue[numbersStack.selfvalue.count-2])! - Double(numbersStack.pop())!
                _ = numbersStack.pop()
            case "*":
                res = Double(numbersStack.pop())! * Double(numbersStack.pop())!
            case "/":
                res = Double(numbersStack.selfvalue[numbersStack.selfvalue.count-2])! / Double(numbersStack.pop())!
                _ = numbersStack.pop()
            case "sin":
                res = sin(Double(numbersStack.pop())!)
            case "cos":
                res = cos(Double(numbersStack.pop())!)
            case "√":
                res = sqrt(Double(numbersStack.pop())!)
            case "^":
                res = pow (Double(numbersStack.selfvalue[numbersStack.selfvalue.count-2])!, Double(numbersStack.pop())!)
                _ = numbersStack.pop()
            default:
                res = 0
            }
            _ = opertionStack.pop()
            numbersStack.push(value: "\(res)")
        }
        
        
        return Double(numbersStack.pop())!
        
    }
    
}

