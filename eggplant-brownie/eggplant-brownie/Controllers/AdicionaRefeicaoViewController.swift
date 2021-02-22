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

class AdicionaRefeicaoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate? // usa var pois a instância é setada na RefeicoesTableController
    let items: [Item] = [
        Item(nome: "Peixe", calorias: 40.0),
        Item(nome: "Farinha de Trigo", calorias: 40.0),
        Item(nome: "Arroz", calorias: 40.0),
        Item(nome: "Macarrão", calorias: 40.0),
        Item(nome: "Vegetais", calorias: 40.0),
        Item(nome: "Molho para Yakisoba", calorias: 40.0)
    ]
    var selectedItems: [Item] = []
    
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
        let item = items[linhaDaTabela]
        celula.textLabel?.text = item.nome
        return celula;
    }
    
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }

        if celula.accessoryType ==  .none {
            celula.accessoryType = .checkmark
            
            let linhaDaTabela = indexPath.row
            selectedItems.append(items[linhaDaTabela])
        } else {
            celula.accessoryType = .none
        }
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
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: selectedItems)
        print("comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
    
}
