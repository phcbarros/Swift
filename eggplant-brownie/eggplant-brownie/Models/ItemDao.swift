//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Paulo Barros on 24/02/21.
//  Copyright © 2021 Paulo Barros. All rights reserved.
//

import Foundation

class ItemDao {
    
    let nome = "itens"
    
    func salvar(_ itens: [Item]) -> Void {
        guard let caminho = recuperarCaminhoDiretorio() else { return }
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func recuperar() -> [Item] {
        guard let caminho = recuperarCaminhoDiretorio() else { return [] }
        
        do {
            let dados = try Data(contentsOf: caminho)
            guard let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [Item] else { return [] }
            return itensSalvos
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    private func recuperarCaminhoDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent(nome)
        
        return caminho
    }
}
