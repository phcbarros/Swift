//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Paulo Barros on 23/02/21.
//  Copyright © 2021 Paulo Barros. All rights reserved.
//

import UIKit

class AdicionarItensViewController: UIViewController {
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBOutlet
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var caloriasTextField: UITextField?
    
    // MARK: - IBAction
    
    @IBAction func adicionarItem() {
        
        guard let nome = nomeTextField?.text, let calorias = caloriasTextField?.text else {
            return
        }
        
        if let numeroDeCalorias = Double(calorias) {
            let item = Item(nome: nome , calorias: numeroDeCalorias)
            navigationController?.popViewController(animated: true)
        }
    }
}
