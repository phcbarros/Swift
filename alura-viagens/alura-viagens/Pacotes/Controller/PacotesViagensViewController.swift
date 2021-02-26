//
//  PacotesViagensViewController.swift
//  alura-viagens
//
//  Created by Paulo Barros on 26/02/21.
//

import UIKit

class PacotesViagensViewController: UIViewController {

    let viagens: [Viagem] = ViagemDAO().retornaTodasAsViagens()
    
    // MARK: - IBOutlet

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colecaoPacotesViagem.dataSource = self
        self.colecaoPacotesViagem.delegate = self
    }
}

extension PacotesViagensViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let viagemAtual = viagens[indexPath.item]
        
        celula.labelTitulo.text = viagemAtual.titulo
        celula.labelQuantidadeDeDias.text = "\(viagemAtual.quantidadeDeDias) \(viagemAtual.quantidadeDeDias == 1 ? "dia" : "dias")"
        celula.labelPreco.text = "R$ \(viagemAtual.preco)"
        celula.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        celula.layer.borderWidth = 0.5
        celula.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        celula.layer.cornerRadius = 8
        return celula
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tamanhoCelula = collectionView.bounds.width / 2
        let espacamentoCelula = 15
        return CGSize(width: Int(tamanhoCelula) - espacamentoCelula, height: 160)
    }
}
