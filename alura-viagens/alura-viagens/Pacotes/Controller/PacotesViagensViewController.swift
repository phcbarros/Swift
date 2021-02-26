//
//  PacotesViagensViewController.swift
//  alura-viagens
//
//  Created by Paulo Barros on 26/02/21.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource {

    let viagens: [Viagem] = ViagemDAO().retornaTodasAsViagens()
    
    // MARK: - IBOutlet

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colecaoPacotesViagem.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = colecaoPacotesViagem.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let viagemAtual = viagens[indexPath.item]
        
        celula.labelTitulo.text = viagemAtual.titulo
        celula.labelQuantidadeDeDias.text = "\(viagemAtual.quantidadeDeDias) \(viagemAtual.quantidadeDeDias > 1 ? "dia" : "dia")"
        celula.labelPreco.text = "R$ \(viagemAtual.preco)"
        celula.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        
        celula.layer.borderWidth = 0.5
        celula.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        celula.layer.cornerRadius = 8
        return celula
    }

}

//extension PacotesViagensViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.viagens.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
//        
//        let viagemAtual = viagens[indexPath.item]
//        
//        celula.labelTitulo.text = viagemAtual.titulo
//        celula.labelQuantidadeDeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
//        celula.labelPreco.text = "R$ \(viagemAtual.preco)"
//        celula.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
//        return celula
//    }
//}
