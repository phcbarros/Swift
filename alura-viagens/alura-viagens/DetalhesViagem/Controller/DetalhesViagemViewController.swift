//
//  DetalhesViagemViewController.swift
//  alura-viagens
//
//  Created by Paulo Barros on 27/02/21.
//

import UIKit

class DetalhesViagemViewController: UIViewController {

    var pacoteSelecionado: PacoteViagem?
    
    // Mark: - IBOutlet
    
    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDesricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    
    
    // MARK: - IBAction
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preencherDados()
    }
    
    func preencherDados() -> Void {
        if let pacote = pacoteSelecionado {
            imagemPacoteViagem.image = UIImage(named: "Assets/\(pacote.viagem.caminhoDaImagem)")
            labelTituloPacoteViagem.text = pacote.viagem.titulo
            labelDesricaoPacoteViagem.text = pacote.descricao
            labelDataViagem.text = pacote.dataViagem
            labelPrecoPacoteViagem.text = "R$ \(pacote.viagem.preco)"
        }
    }
}
