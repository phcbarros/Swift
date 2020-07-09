//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Paulo Barros on 29/06/20.
//  Copyright © 2020 Paulo Barros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextField: UITextField! //unwrap
    @IBOutlet weak var felicidadeTextField: UITextField!
    
    @IBAction func adicionar(_ sender: Any) {
        let nome = nomeTextField.text
        let felicidade = felicidadeTextField.text
        print("comi \(nome) e fiquei com \(felicidade)")
    }
    
}
