//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Paulo Barros on 23/02/21.
//  Copyright © 2021 Paulo Barros. All rights reserved.
//

import UIKit

protocol AdicionarItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Atributos
    var delegate: AdicionarItensDelegate?
     
    init(delegate: AdicionarItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
    }
}
