//
//  Extensions.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 7/21/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

    import Foundation

        extension String {
            //operation priority
            var precedence: Int {
                get {
                    switch self {
                    case "+":
                        return 4
                    case "-":
                        return 4
                    case "×":
                        return 3
                    case "÷":
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
        // extension that inform that it is operation
        var isOperator: Bool {
            get {
                return ("+ - × ÷ sin cos ^ √ ( ) ln log tan ctg еxp !" as NSString).contains(self)
            }
        }
        // extension that inform ta=hat it is number
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

    // extension for double that remove zero
        extension Double {
            var clean: String {
                return self.truncatingRemainder(dividingBy: 1) == 0 ?
                    String(format: "%.0f", self) : String(self)
            }
        }

        // extension that returns element at index
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
