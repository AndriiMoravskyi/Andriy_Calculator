//
//  KeyboardController.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 6/29/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import UIKit


class KeyboardController: UIViewController {

    var onNumTap: ((_ num: Int)->())?
    var SymbolTap :((_ symbol: Int)->())?
    
    @IBAction func onNumericTap(button: UIButton) {
        onNumTap?(button.tag)
    }
    
    @IBAction func onSymbolTap(button: UIButton) {
        SymbolTap?(button.tag)
    }
}
