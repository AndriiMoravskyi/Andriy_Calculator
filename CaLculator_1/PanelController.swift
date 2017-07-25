//
//  PanelController.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 6/29/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import UIKit

class PanelController: UIViewController {

    var display: DisplayController!
    var keyboard: KeyboardController!
    let input = InputAdapter.shared
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DisplayControllerSegue", let controller = segue.destination as? DisplayController {
            
            display = controller
        }
        else if segue.identifier == "KeyboardControllerSegue", let controller = segue.destination as? KeyboardController {
            
            keyboard = controller
            keyboard.onNumTap = { [weak self] num in
                self?.onNumericTap(num: num)
            }
            keyboard.SymbolTap = { [weak self] symbol in
                self?.onSymbolTap(symbol: symbol)
        }
      }
    }
    func onNumericTap(num: Int) {
        input.enterNum(num)
    }
    func onSymbolTap(symbol: Int) {
        input.enterUtility(Operation(rawValue: symbol)!)
        }
}



