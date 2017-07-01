//
//  Protocols.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 6/29/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import Foundation

/*enum Operation {
    case pls
    case min
    case mul
    case div
    case equal
}

protocol InputProtocol {
    func input(value: Int)
    func input(operation: Operation)
}

protocol OutputProtocol {
    func output(value: String)
}

protocol Model {
    func input(operation: Operation)
}
 */
 protocol InputProtocol {
 func enterNum(_number: Int)
 func enterUtility(_symbol: String)
 }
 
 protocol OutputProtocol {
 func presentResult(result: String)
 }
 
 protocol Model {
 func EnterEquation(equation: String)
 
 } 
