//
//  ViewController.swift
//  example-configurartion-schemes
//
//  Created by Paulo Barros on 01/07/20.
//  Exemplo de código retirado do site https://shockoe.com/blog/how-to-setup-configurations-and-schemes-in-xcode/
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        #if LOCAL
            environmentLabel.text = "Local development build!*"
         #elseif DEV
             environmentLabel.text = "Dev build!"
         #elseif QA
            environmentLabel.text = "QA build!"
         #elseif PROD
             environmentLabel.text = "Production build!"
         #endif
    }


    @IBOutlet weak var environmentLabel: UILabel!
}

