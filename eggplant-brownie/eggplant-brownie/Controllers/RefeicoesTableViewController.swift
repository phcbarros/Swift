//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by MAC-00055 on 30/07/20.
//  Copyright © 2020 Paulo Barros. All rights reserved.
//

import Foundation
import UIKit

class RefeicoesTableViewController : UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes: [Refeicao] = []
    
    override func viewDidLoad() {
        refeicoes = RefeicoesDao().recuperar()
    }

    // número de linhas da tabela - obrigatório implementar esse método
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    // para cada número de linhas da tabela esse método será executado - obrigatório implementar esse método
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row] // posição da linha que a tableView está executando
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        return celula
    }
    
    // por questões de legibilibidade usamos o _ para ocultar o parametro
    func add(_ refeicao: Refeicao) -> Void {
        refeicoes.append(refeicao)
        tableView.reloadData()
        
        RefeicoesDao().salvar(refeicoes)
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if(gesture.state == .began) {
            let celula = gesture.view as! UITableViewCell
            
            //recupera o item da tabela que foi pressionado
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
           
            RemoveRefeicaoViewController(controller: self).remover(refeicao, handler: { alert in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? AdicionaRefeicaoViewController {
                viewController.delegate = self
            }
        }
    }
}
