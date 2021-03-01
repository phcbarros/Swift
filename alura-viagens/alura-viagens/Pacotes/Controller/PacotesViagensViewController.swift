//
//  PacotesViagensViewController.swift
//  alura-viagens
//
//  Created by Paulo Barros on 26/02/21.
//

import UIKit

class PacotesViagensViewController: UIViewController {

    let listaTodasViagens: [PacoteViagem] = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens: [PacoteViagem] = []
    
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
        
        let pacoteAtual = listaViagens[indexPath.item]
        celula.configurarCelula(pacote: pacoteAtual)
        return celula
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tamanhoCelula = collectionView.bounds.width / 2
        let espacamentoCelula = 15
        return CGSize(width: Int(tamanhoCelula) - espacamentoCelula, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacoteViagemSelecionado = listaViagens[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "detalhes") as DetalhesViagemViewController
        controller.pacoteSelecionado = pacoteViagemSelecionado
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension PacotesViagensViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaTodasViagens
        
        if (searchText != "") {
            //let filtroListaViagem = NSPredicate(format: "viagem.titulo[cd] contains %@", searchText)
            //let viagensFiltradas: [PacoteViagem] = (listaTodasViagens as NSArray).filtered(using: filtroListaViagem) as! Array
            //listaViagens = viagensFiltradas
            listaViagens = listaViagens.filter({ $0.viagem.titulo.contains(searchText) })
        }
      
        labelResultadoFiltro.text = atualizarLabelResultadoFitlro()
        colecaoPacotesViagem.reloadData()
    }
    
    func atualizarLabelResultadoFitlro() -> String {
        return listaViagens.count == 1 ? "1 resultado encontrado" : "\(listaViagens.count) resultados encontrados"
    }
}
