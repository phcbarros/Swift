//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Paulo Barros on 29/06/20.
//  Copyright © 2020 Paulo Barros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    @IBAction func adicionar(_ sender: Any) {
        
//        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaReceicao = felicidadeTextField?.text {
//            let nome = nomeDaRefeicao
//            if let felicidade = Int(felicidadeDaReceicao) {
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//                print("comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
//            }
//            else {
//                print("Erro ao tentar criar a refeição")
//            }
//
//        }
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaReceicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaReceicao)  else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        print("comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")

    }
    
}
