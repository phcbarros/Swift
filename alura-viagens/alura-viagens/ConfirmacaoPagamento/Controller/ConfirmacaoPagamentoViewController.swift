//
//  ConfirmacaoPagamentoViewController.swift
//  alura-viagens
//
//  Created by Paulo Barros on 01/03/21.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {

    var pacoteComprado: PacoteViagem? = nil
    // MARK: - IBOulets
    
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTituloViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
    @IBOutlet weak var labelNomeHotel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carregarDados()

        // Do any additional setup after loading the view.
    }
    
    func carregarDados() {
        if let pacote = pacoteComprado {
            imagemViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            labelTituloViagem.text = pacote.viagem.titulo
            labelNomeHotel.text = pacote.nomeDoHotel
            labelDataViagem.text = pacote.dataViagem
            labelDescricao.text = pacote.descricao
        }
    }

    // MARK: - IBActions
    
    @IBAction func botaoIrParaHome(_ sender: UIButton) {
        
    }
}
