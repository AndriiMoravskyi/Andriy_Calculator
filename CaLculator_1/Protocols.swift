//
//  Protocols.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 6/29/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import Foundation

/* 
 enum symbolsUtility: Int{
 case pls = 10001
 case mns = 10002
 case mul = 10003
 case div = 10004
 case pow = 10005
 case sqrt = 10006
 case sin = 10007
 case cos = 10008
 case log = 10009
 case leftBracket = 10010
 case rightBracket = 10011
 case pi = 10012
 case equal = 10013
 case clear = 10014
 case dot = 10015
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
