//
//  PacoteViagemCollectionViewCell.swift
//  alura-viagens
//
//  Created by Paulo Barros on 26/02/21.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    func configurarCelula(pacote: PacoteViagem) {
        labelTitulo.text = pacote.viagem.titulo
        labelQuantidadeDeDias.text = pacote.viagem.quantidadeDeDias == 1 ? "1 dia" : "\(pacote.viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(pacote.viagem.preco)"
        imagemViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        layer.cornerRadius = 8
    }
}
