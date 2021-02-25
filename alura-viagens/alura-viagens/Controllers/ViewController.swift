//
//  ViewController.swift
//  alura-viagens
//
//  Created by Paulo Barros on 25/02/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let viagens: [Viagem] = ViagemDAO().retornaTodasAsViagens()
    
    // MARK: - IBOutlet
    @IBOutlet weak var tabelaViagens: UITableView?
    @IBOutlet weak var viewButtonHoteis: UIView?
    @IBOutlet weak var viewButtonPacotes: UIView?
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // define que o esse controller (self) irá controlar a tabela
        self.tabelaViagens?.dataSource = self
        self.viewButtonHoteis?.layer.cornerRadius = 10
        self.viewButtonPacotes?.layer.cornerRadius = 10
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        celula.textLabel?.text = viagens[indexPath.row].titulo
        return celula
    }
    
}

