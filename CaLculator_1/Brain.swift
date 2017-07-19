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


    extension String {

        var precedence: Int {
        get {
            switch self {
            case "+":
                return 4
            case "-":
                return 4
            case "*":
                return 3
            case "/":
                return 3
            case "^":
                return 2
            case "еxp":
               return 2
            case "!":
                return 2
            case "√":
                return 2
            case "ln":
                return 1
            case "log":
                return 1
            case "tan":
                return 1
            case "ctg":
                return 1
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
        return ("+ - * / sin cos ^ √ ( ) ln log tan ctg еxp !" as NSString).contains(self)
        }
    }

    var isNumber: Bool {
        get {
        return !isOperator
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
        }
        else {
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
                    _ = opertionStack.pop()
                    numbersStack.push(value: "\(res)")
                }

                }
                _ = opertionStack.pop()
                }

                else if token != "(" && token != ")" && opertionStack.peek != "(" && opertionStack.peek.precedence <= token.precedence {

                if !opertionStack.empty  {
                var res = 0.0
                res = Simplecalculation(Operationsymbol: opertionStack, Operands: numbersStack)
                _ = opertionStack.pop()
                numbersStack.push(value: "\(res)")
                }
                }
                if token != ")" {opertionStack.push(value: token)}
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
        res = tan(Double(Operands.pop())!)
        case "ctg":
        res = 1.0/tan(Double(Operands.pop())!)
        case "!" :
        res = Double(factorial(n: Int(Operands.pop())!))
        case "ln" :
        res = log(Double(Operands.pop())!)
        case "log" :
        res = log(Double(Operands.pop())!)/log(10.0)
        default:
        res = 0
    }
    return res
    }

    func factorial(n: Int) -> Int{
        
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
        Mod = Mod1.replacingOccurrences(of: "π", with: "\(Double.pi)")
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
