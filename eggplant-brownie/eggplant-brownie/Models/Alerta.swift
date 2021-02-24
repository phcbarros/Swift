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
    
    func exibe() -> Void {
        let alerta = UIAlertController(title: "Desculpe", message: "Não foi possível atualizar a tabela", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
