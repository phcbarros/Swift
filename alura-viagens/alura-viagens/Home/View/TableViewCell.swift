//
//  TableViewCell.swift
//  alura-viagens
//
//  Created by Paulo Barros on 25/02/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    // MARK: - IBOutlet

    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imagemViagem: UIImageView!
    
    func configuraCelula(_ viagem: Viagem) {
        labelTitulo.text = viagem.titulo
        labelQuantidadeDeDias.text = viagem.quantidadeDeDias == 1 ? "1 dia" : "\(viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(viagem.preco)"
        imagemViagem.image = UIImage(named: viagem.caminhoDaImagem)
        imagemViagem.layer.cornerRadius = 10
        imagemViagem.layer.masksToBounds = true
    }
}
