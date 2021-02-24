//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Paulo Barros on 24/02/21.
//  Copyright © 2021 Paulo Barros. All rights reserved.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    // MARK: - Métodos
    
    // @escaping guarda a referência da closures para ser executada em outro momento
    func remover(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) -> Void {
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        alerta.addAction(botaoCancelar)
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive,
             handler: handler)
        alerta.addAction(botaoRemover)
        
        controller.present(alerta, animated: true, completion: nil)
    }
}
