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
    
 func EnterEquation(equation: String) {
 self.equation = equation
 output.presentResult(result: equation)
 }

func Change (input : String) -> String {
    var Mod =  input.replacingOccurrences(of: "×", with: "*")
    var Mod1 = Mod
    Mod = Mod1.replacingOccurrences(of: "÷", with: "/")
    Mod1 = Mod
    Mod = Mod1.replacingOccurrences(of: "^", with: "**")
    return Mod
}
  
    func Caculation(calculation: (String)->()){
    
    let Mod = Change(input: equation)
    
    let expr = NSExpression(format: Mod)
    if let result = expr.expressionValue(with: nil, context: nil) as? Double {
        output.presentResult(result: String(result))
        
    } else {
    output.presentResult(result: "error in calculation")
    }
}
}
