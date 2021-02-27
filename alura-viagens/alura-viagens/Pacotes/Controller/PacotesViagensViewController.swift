//
//  PacotesViagensViewController.swift
//  alura-viagens
//
//  Created by Paulo Barros on 26/02/21.
//

import UIKit

class PacotesViagensViewController: UIViewController {

    let listaTodasViagens: [Viagem] = ViagemDAO().retornaTodasAsViagens()
    var listaViagens: [Viagem] = []
    
    // MARK: - IBOutlet

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var labelResultadoFiltro: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaTodasViagens
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        pesquisarViagens.delegate = self
        labelResultadoFiltro.text = atualizarLabelResultadoFitlro()
    }
}

extension PacotesViagensViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        let viagemAtual = listaViagens[indexPath.item]
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "detalhes")
        
        self.present(controller, animated: true, completion: nil)
    }
}

extension PacotesViagensViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaTodasViagens
        
        if (searchText != "") {
            let filtroListaViagem = NSPredicate(format: "titulo[cd] contains %@", searchText)
            let viagensFiltradas: [Viagem] = (listaTodasViagens as NSArray).filtered(using: filtroListaViagem) as! Array
            listaViagens = viagensFiltradas
        }
      
        labelResultadoFiltro.text = atualizarLabelResultadoFitlro()
        colecaoPacotesViagem.reloadData()
    }
    
    func atualizarLabelResultadoFitlro() -> String {
        return listaViagens.count == 1 ? "1 resultado encontrado" : "\(listaViagens.count) resultados encontrados"
    }
}
