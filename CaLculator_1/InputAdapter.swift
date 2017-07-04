//
//  InputAdapter.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 6/29/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import Foundation

/*class IntputAdapter: InputProtocol {
    static let shared = IntputAdapter()
    
    let brain = Brain.shared
    
    func input(value: Int) {
        // Conversion if needed
        brain.input(number: value)
    }
    
    func input(operation: Operation) {
        brain.input(operation: operation)
    }
}
*/
 class IntputAdapter: InputProtocol
 {
 static let shared = IntputAdapter()
 
 let brain = Brain.shared
 var input:String!
 
func enterNum(_number: Int){
        if input == nil || input == "0" {
            input = String(_number)
        } else{ input = input + "\(_number)"}
 
       brain.EnterEquation(equation: input)
    
        }
 

func enterUtility(_symbol: String){
    if _symbol == "=" {
        input = ""
        brain.Caculation(calculation: {result in input = result})
    }
    else {
        
        input = input + _symbol
        brain.EnterEquation(equation: input)
        }
   }
}
