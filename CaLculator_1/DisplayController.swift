
//
//  DisplayController.swift
//  CaLculator_1
//
//  Created by Andriy_Moravskyi on 6/29/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

    import UIKit

    class DisplayController: UIViewController {
        @IBOutlet weak var cat: UIImageView!
        @IBOutlet weak var scroll: UIScrollView!
        @IBOutlet weak var displayLab: UILabel!
        let output = OutputAdapter.shared
        
        func presentResult(value: String) {
            if displayLab.text!.characters.count < value.characters.count{
                scroll.scrollRectToVisible(displayLab.bounds, animated: true)
            }
            displayLab.text = value
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            
            output.display = self
            
            // NotoficationCenter handler
            let presentCatNotificarionName = Notification.Name("PresentCatNotification")
            NotificationCenter.default.addObserver(self, selector: #selector(presentCat), name: presentCatNotificarionName, object: nil)
        }
        //function wich present image
        func presentCat() {
            view.bringSubview(toFront: cat)
            
            UIView.animate(withDuration: 0.0, animations: {
                self.cat.alpha = 1.0
            }) { (true) in
                UIView.animate(withDuration: 3.0, animations: {
                    self.cat.alpha = 0.0
                })
            }
        }
    }
