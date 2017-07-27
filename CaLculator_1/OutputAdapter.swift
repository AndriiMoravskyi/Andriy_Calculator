//
//  OutputAdapter.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 6/29/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import Foundation

class OutputAdapter: OutputProtocol {
    static let shared = OutputAdapter()
    var display: DisplayController?

    func presentResult(result: String){
    display?.presentResult(value: result)
    }
}
