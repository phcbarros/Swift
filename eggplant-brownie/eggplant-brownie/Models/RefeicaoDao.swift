//
//  RefeicaoDao.swift
//  eggplant-brownie
//
//  Created by Paulo Barros on 24/02/21.
//  Copyright © 2021 Paulo Barros. All rights reserved.
//

import Foundation

class RefeicoesDao {
    
    let nome = "refeicao"
    
    func salvar(_ refeicoes: [Refeicao]) -> Void {
        guard let caminho = recuperarCaminhoDiretorio(arquivo: nome) else { return }
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            // salva os dados
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func recuperarCaminhoDiretorio(arquivo: String) -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent(arquivo)
        
        return caminho
    }
    
    func recuperar() -> [Refeicao] {
        guard let caminho = recuperarCaminhoDiretorio(arquivo: nome) else { return [] }
        do {
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [Refeicao]
                else { return [] }
            
            return refeicoesSalvas
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
