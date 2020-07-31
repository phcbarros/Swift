//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by MAC-00055 on 30/07/20.
//  Copyright © 2020 Paulo Barros. All rights reserved.
//

import Foundation
import UIKit

class RefeicoesTableViewController : UITableViewController {
    
    var refeicoes = [
        Refeicao(nome: "Temaki", felicidade: 5),
        Refeicao(nome: "Hot-roll", felicidade: 5),
        Refeicao(nome: "Yakisoba", felicidade: 4)
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
    
    func add(_ refeicao: Refeicao) -> Void {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.tableViewControler = self
        }
    }
}
