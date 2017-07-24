
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
             
        @IBOutlet weak var Cat: UIImageView!
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
            
            // NotoficationCenter handler
            let presentCatNotificarionName = Notification.Name("PresentCatNotification")
            NotificationCenter.default.addObserver(self, selector: #selector(presentCat), name: presentCatNotificarionName, object: nil)
        }
        
        func presentCat() {
            print("Recieved notification to present Cat")
            Cat.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
            view.bringSubview(toFront: Cat)
            
            UIView.animate(withDuration: 2.0, animations: {
                self.Cat.alpha = 1.0
            }) { (true) in
                UIView.animate(withDuration: 2.0, animations: { 
                    self.Cat.alpha = 0.0
                })
            }
        }
}
