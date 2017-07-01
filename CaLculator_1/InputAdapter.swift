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
 var result:String!
 
func enterNum(_number: Int){
        if result == nil || result == "0" {
            result = String(_number)
        } else{ result = result + "\(_number)"}
 
       brain.EnterEquation(equation: result)
 }
 

func enterUtility(_symbol: String){
 result = result + _symbol
 
 }

}
