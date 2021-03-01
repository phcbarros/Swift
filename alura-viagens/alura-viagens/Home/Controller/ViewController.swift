//
//  ViewController.swift
//  alura-viagens
//
//  Created by Paulo Barros on 25/02/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        
        // define que esse controller irá implementar esses métodos
        self.tabelaViagens?.delegate = self
        self.viewButtonHoteis?.layer.cornerRadius = 10
        self.viewButtonPacotes?.layer.cornerRadius = 10
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // converte para a classe que vai controlar a celula
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! TableViewCell
        let viagem = viagens[indexPath.row]
        celula.configuraCelula(viagem)
       
        return celula
    }
    
    // MARK: - IUTableViewDelegate
    
    // aumenta efetivamente o tamanho da célula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
    }
}

