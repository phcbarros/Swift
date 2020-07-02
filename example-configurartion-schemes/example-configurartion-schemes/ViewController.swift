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
            #if DEBUG
                environmentLabel.text = "Local development build!* - Debug"
            #else
                environmentLabel.text = "Local development build!* - Release"
            #endif
        #elseif DEV
            #if DEBUG
                environmentLabel.text = "Dev build! - Debug"
            #else
                environmentLabel.text = "Dev build! - Release"
            #endif
        #elseif QA
            #if DEBUG
                environmentLabel.text = "QA build! - Debug"
            #else
                environmentLabel.text = "QA build! - Release"
            #endif
        #elseif PROD
            #if DEBUG
                environmentLabel.text = "Production build! - Debug"
            #else
                environmentLabel.text = "Production build! - Release"
            #endif
        #endif
    }


    @IBOutlet weak var environmentLabel: UILabel!
    
}

