//
//  Brain.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 6/29/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import Foundation

/*class Brain: Model {
    static let shared = Brain()
    
    let output = OutputAdapter.shared
    
    var operand: String = ""
    
    func input(number: Int) {
        operand += "\(number)"
        process()
    }
    
    func input(operation: Operation) {
        
    }
    
    func process() {
        //....
        output.output(value: operand)
    }
}
*/
 class Brain: Model {
 static let shared = Brain()
 
 
 let output = OutputAdapter.shared

 var equation: String!
 
 
 func EnterEquation(equation: String) {
 self.equation = equation
 process()
 }
 func process() {
 
 output.presentResult(result: equation)
 }
}
