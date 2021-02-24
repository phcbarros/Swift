//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Paulo Barros on 24/02/21.
//  Copyright © 2021 Paulo Barros. All rights reserved.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
        
    }
    
    func exibe(titulo: String = "Atenção", mensagem: String) -> Void {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
