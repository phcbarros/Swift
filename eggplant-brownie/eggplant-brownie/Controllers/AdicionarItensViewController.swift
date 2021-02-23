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
    
    // MARK: - IBAction
    @IBAction func adicionarItem() {
        navigationController?.popViewController(animated: true)
    }
}
