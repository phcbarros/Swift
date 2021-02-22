//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Paulo Barros on 29/06/20.
//  Copyright © 2020 Paulo Barros. All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class AdicionaRefeicaoViewController: UIViewController, UITableViewDataSource {
    
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate? // usa var pois a instância é setada na RefeicoesTableController
    let items: [String] = ["Peixe",  "Farinha de Trigo", "Arroz", "Macarrão", "Vegetais", "Molho para Yakisoba", "Alga"]
    
    // MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linhaDaTabela = indexPath.row
        let item = items[indexPath.row]
        celula.textLabel?.text = item
        return celula;
    }
    
    // MARK: - IBActions
    
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
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
    
}
