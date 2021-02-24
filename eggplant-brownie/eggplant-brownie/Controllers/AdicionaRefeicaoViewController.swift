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

class AdicionaRefeicaoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionarItensDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate? // usa var pois a instância é setada na RefeicoesTableController
    var itens: [Item] = [
        Item(nome: "Peixe", calorias: 40.0),
        Item(nome: "Farinha de Trigo", calorias: 40.0),
        Item(nome: "Arroz", calorias: 40.0),
        Item(nome: "Macarrão", calorias: 40.0),
        //Item(nome: "Vegetais", calorias: 40.0),
        //Item(nome: "Molho para Yakisoba", calorias: 40.0)
    ]
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        let botaoAdicionarItem = UIBarButtonItem(title: "Add Item", style: .plain, target: self, action: #selector(adicionarItem))
        
        navigationItem.rightBarButtonItem = botaoAdicionarItem
    }
    
    // adiciona @objc para o método poder ser usado em objective c
    @objc func adicionarItem() -> Void {
        print("adicionar item")
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        
        if let tableView = itensTableView {
            tableView.reloadData()
        }
        else {
            Alerta(controller: self).exibe(mensagem: "Não foi possível atualizar a tabela")
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        celula.textLabel?.text = item.nome
        return celula;
    }
    
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }

        let linhaDaTabela = indexPath.row
        let itemSelecionado = itens[linhaDaTabela]
        if celula.accessoryType ==  .none {
            celula.accessoryType = .checkmark
            
            itensSelecionados.append(itemSelecionado)
        } else {
            celula.accessoryType = .none
           
            if let position = itensSelecionados.firstIndex(of: itemSelecionado) {
                itensSelecionados.remove(at: position)
            }
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
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        print("comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
        print(refeicao.detalhes())
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
    
}
