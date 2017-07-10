//
//  Trigonometry.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 7/6/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import Foundation

extension NSExpression {
    func sin (param: Double) -> NSExpression {
    return Darwin.sin(self.doubleValue) as NSExpression
    }
}
