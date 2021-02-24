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

class AdicionaRefeicaoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate? // usa var pois a instância é setada na RefeicoesTableController
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        let botaoAdicionarItem = UIBarButtonItem(title: "Add Item", style: .plain, target: self, action: #selector(adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionarItem
        itens = ItemDao().recuperar()
    }
    
    // adiciona @objc para o método poder ser usado em objective c
    @objc func adicionarItem() -> Void {
        print("adicionar item")
        let adicionarItensViewController = AdicionaItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        
        if let tableView = itensTableView {
            tableView.reloadData()
            
            ItemDao().salvar(itens)
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
    
    
    func recuperaRefeicaoDoFormulario() -> Refeicao? {
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return nil
        }
        
        guard let felicidadeDaReceicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaReceicao)  else {
            return nil
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        print("comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
        print(refeicao.detalhes())
        
        return refeicao
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        if let refeicao = recuperaRefeicaoDoFormulario() {
            delegate?.add(refeicao)
            navigationController?.popViewController(animated: true)
        }
        else {
            Alerta(controller: self).exibe(mensagem: "Erro ao ler os dados do formulário")
        }
    }
}
