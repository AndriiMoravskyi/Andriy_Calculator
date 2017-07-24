//
//  Parser.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 7/11/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import Foundation
extension String {
    
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


extension String {
    var isOperator: Bool {
        get {
            return ("+ - / * ^ % sin cos" as NSString).contains(self)
        }
    }
    var isNumber: Bool {
        get {
            if let _ = Double(self) { return true }
            return false
        }
    }
    var precedence: Int {
        get {
            switch self {
            case "sin":
                return 0
            case "cos":
                return 0
            case "/":
                return 2
            case "*":
                return 2
            case "%":
                return 2
            case "+":
                return 3
            case "-":
                return 3
            case "^":
                return 1
            default:
                return -1
            }
        }
    }
}

struct Stack {
    
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
    
    mutating func push(value: String) {
        selfvalue.append(value)
    }
    
    mutating func pop() -> String {
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

class MathParser {
    
    var outputQueue: [String] = []
    var stack: Stack = Stack()
    
    func parse(tokens: String) -> Double {
        var tokens = tokens
        if (tokens as NSString).contains("(") {
            var finalToks = ""
            var isTakingChars = false
            for i in tokens.characters {
                if i == ")" {
                    finalToks += "\(i)"
                    isTakingChars = false
                }
                if isTakingChars {
                    finalToks += "\(i)"
                }
                if i == "(" {
                    if finalToks != "" {
                        finalToks += "$"
                    }
                    finalToks += "\(i)"
                    isTakingChars = true
                }
            }
            for i in finalToks.components(separatedBy:"$")            {
                let bracketOpen = "("
                let bracketClose = ")"
                let hand = MathParser()
                tokens = tokens.replacingOccurrences(of: i, with: "\(hand.parse(tokens: i.replacingOccurrences(of: bracketClose, with: String()).replacingOccurrences(of: bracketOpen, with: String())))")
            }
        }
        let toksArr = tokens.components(separatedBy :" ")
        for token in toksArr {
            if token.isOperator {
                if stack.selfvalue.count != 0 {
                    for  _ in stack.selfvalue{
                        if stack.selfvalue.count != 0 {
                            if stack.peek.precedence <= token.precedence {
                                outputQueue.append(stack.pop())
                            }
                        }
                    }
                }
                stack.push(value: token)
            }
            if token.isNumber {
                outputQueue.append(token)
            }
        }
        while !stack.empty {
            outputQueue.append(stack.pop())
        }
        var newStack = Stack()
        for token in outputQueue {
            if token.isNumber {
                newStack.push(value: token)
            } else {
                var n1 = Double()
                var n2 = Double()
                if let _ = Double(newStack.peek) {
                    n1 = Double(newStack.pop())!
                    if let _ = Double(newStack.peek) {
                        n2 = Double(newStack.pop())!
                    }
                }
                
                let result = token == "+" ? n1 + n2 : token == "-" ? n2 - n1 : token == "*" ? n1 * n2 : token == "/" ? n2 / n1 : token == "^" ? pow(n2,n1) : token == "%" ? n1 / 100 : token == "sin" ? sin(n1) : token == "cos" ? cos(n1): 0
                
                newStack.push(value: "\(result)")
            }
        }
        return Double(newStack.pop())!
        
    }
    
}
