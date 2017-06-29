//
//  KeyboardController.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 6/29/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import UIKit
enum UtilityButton: Int {
    case dot = 10001
    case equal = 10002
}

class KeyboardController: UIViewController {

    var onNumTap: ((_ num: Int)->())?
    
    @IBAction func onNumericTap(button: UIButton) {
        onNumTap?(button.tag)
    }
    
    @IBAction func onUtilityTap(button: UIButton) {
        onNumTap?(button.tag)
    }
}
