
//
//  DisplayController.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 6/29/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import UIKit

    class DisplayController: UIViewController {
        
        
        @IBOutlet weak var DisplayLab: UILabel!
              
        @IBOutlet weak var Scroll: UIScrollView!
             
       let output = OutputAdapter.shared
        
        func presentResult(value: String) {
            if DisplayLab.text!.characters.count < value.characters.count{
                Scroll.scrollRectToVisible(DisplayLab.bounds, animated: true)
            }
            DisplayLab.text = value
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            
            output.display = self
        }
   
}
